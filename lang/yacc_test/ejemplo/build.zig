const std = @import("std");
const os = std.os;

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    std.process.changeCurDir(b.build_root.path.?) catch {
        std.log.err("Failed to set cwd", .{});
        return;
    };

    // Flex + Bison
    const gen_flex = b.addSystemCommand(&.{ "flex", "-L", "src/lexer.l" });
    const mv_flex = b.allocator.create(MoveFileStep) catch unreachable;
    mv_flex.* = MoveFileStep.init(b, "Moving flex source into ./src", &.{"./lex.yy.c"}, &.{"./src/lexer.c"});
    mv_flex.step.dependOn(&gen_flex.step);
    const gen_bison = b.addSystemCommand(&.{ "bison", "-ld", "src/grammar.y" });
    const mv_bison = b.allocator.create(MoveFileStep) catch unreachable;
    mv_bison.* = MoveFileStep.init(b, "Moving bison source into ./src", &.{ "./grammar.tab.c", "./grammar.tab.h" }, &.{ "./src/parser.c", "./src/parser.h" });
    mv_bison.step.dependOn(&gen_bison.step);

    // Dummy flex
    const gen_dflex = b.addSystemCommand(&.{ "flex", "-L", "src/ddlexer.l" });
    const mir_dflex = b.step("dummy", "Generar un analizador lexico de juguete");
    const mv_dflex = b.allocator.create(MoveFileStep) catch unreachable;
    mv_dflex.* = MoveFileStep.init(b, "Moving flex source into ./src", &.{"./lex.dd.c"}, &.{"./src/ddlexer.c"});
    mir_dflex.makeFn = makeDummyLexer;
    gen_dflex.step.dependOn(mir_dflex);
    mv_dflex.step.dependOn(&gen_dflex.step);

    const flags = .{ "-W", "-Wall", "-Wextra", "-Werror", "-pedantic", "-pedantic-errors", "-Wno-error=sign-compare" };

    if (!target.isWindows()) {
        {
            const clean = b.addSystemCommand(&.{ "sh", "./scripts/clean.sh" });
            const clean_step = b.step("clean", "Borrar lexer.{c,h}, parser.{c, h}");
            clean_step.dependOn(&clean.step);
        }

        {
            const format = b.addSystemCommand(&.{ "sh", "./scripts/format.sh" });
            const format_step = b.step("format", "Limpiar el codigo en todos los .h y .c");
            format_step.dependOn(&format.step);
        }
    }

    {
        const gen_step = b.step("gen", "Generar lexer.{c,h}, parser.{c, h}");
        gen_step.dependOn(&mv_flex.step);
        gen_step.dependOn(&mv_bison.step);
        gen_step.dependOn(&mv_dflex.step);
    }

    {
        const lexer = b.addExecutable(.{ .name = "lexer", .target = target, .optimize = optimize });

        lexer.linkLibC();
        lexer.addCSourceFiles(&.{ "src/dlexer.c", "src/ddlexer.c", "src/parser.c" }, &flags);
        lexer.step.dependOn(&mv_flex.step);
        lexer.step.dependOn(&mv_bison.step);
        lexer.step.dependOn(&mv_dflex.step);

        const run_cmd = b.addRunArtifact(lexer);
        run_cmd.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd.addArgs(args);

        const lexer_step = b.step("lex", "Ejectuar solo el lexer (src/dlexer.c)");
        lexer_step.dependOn(&run_cmd.step);
    }

    {
        const exe = b.addExecutable(.{ .name = "main", .target = target, .optimize = optimize });
        b.installArtifact(exe);

        exe.linkLibC();
        exe.addCSourceFiles(&.{ "src/main.c", "src/lexer.c", "src/parser.c" }, &flags);
        exe.step.dependOn(&mv_flex.step);
        exe.step.dependOn(&mv_bison.step);
        exe.step.dependOn(&mv_dflex.step);

        const run_cmd = b.addRunArtifact(exe);
        run_cmd.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd.addArgs(args);

        const run_step = b.step("run", "Ejecutar el programa final");
        run_step.dependOn(&run_cmd.step);
    }
}

pub fn replaceDummyReturns(inp: []const u8, buffer: []u8) usize {
    var i: usize = 0;
    var j: usize = 0;
    while (i < inp.len) {
        switch (inp[i]) {
            'r' => {
                if (inp.len > i + 5 and std.mem.eql(u8, inp[i .. i + 6], "return")) {
                    @memcpy(buffer[j .. j + 6], "puts(\"");
                    j += 6;
                    i += 6;
                    while (inp[i] != ';' and i < inp.len) {
                        if (inp[i] != ' ' and inp[i] != '\t' and inp[i] != '\r') {
                            buffer[j] = inp[i];
                            j += 1;
                        }
                        i += 1;
                    }
                    if (inp[i] == ';') {
                        @memcpy(buffer[j .. j + 3], "\");");
                        j += 3;
                    } else {
                        std.log.err("';' not found at end of return statement", .{});
                    }
                } else {
                    buffer[j] = 'r';
                    j += 1;
                }
            },
            '%' => {
                if (inp.len > i + 18 and std.mem.eql(u8, inp[i .. i + 19], "%option prefix=\"yy\"")) {
                    @memcpy(buffer[j .. j + 19], "%option prefix=\"dd\"");
                    j += 19;
                    i += 18;
                } else {
                    buffer[j] = '%';
                    j += 1;
                }
            },
            '/' => {
                if (inp.len > i + 6 and std.mem.eql(u8, inp[i .. i + 7], "/lexer.")) {
                    @memcpy(buffer[j .. j + 9], "/ddlexer.");
                    j += 9;
                    i += 6;
                } else {
                    buffer[j] = '/';
                    j += 1;
                }
            },
            else => {
                buffer[j] = inp[i];
                j += 1;
            },
        }

        i += 1;
    }

    return j;
}

pub fn makeDummyLexer(self: *std.build.Step, progress: *std.Progress.Node) !void {
    _ = std.fs.cwd().openFile("build.zig", .{}) catch {
        std.log.err("Ejecuta zig build desde el mismo directorio de build.zig", .{});
        return;
    };

    var file = try std.fs.cwd().openFile("src/lexer.l", .{ .mode = .read_only });
    defer file.close();

    var contents: [20_000]u8 = .{};
    var final: [25_000]u8 = .{};
    const size = try file.readAll(&contents);

    var dest_file = try std.fs.cwd().createFile("src/ddlexer.l", .{ .truncate = true });
    defer dest_file.close();

    const final_size = replaceDummyReturns(contents[0..size], &final);

    try dest_file.writeAll(final[0..final_size]);
    _ = progress;
    _ = self;
}

const MoveFileStep = struct {
    step: std.build.Step,
    context: []const u8,
    from: []const []const u8,
    into: []const []const u8,

    pub fn init(b: *std.build.Builder, context: []const u8, from: []const []const u8, into: []const []const u8) MoveFileStep {
        return .{ .step = std.build.Step.init(.{
            .id = .custom,
            .name = "Move step",
            .owner = b,
            .makeFn = make,
        }), .context = context, .from = from, .into = into };
    }
    fn make(step: *std.build.Step, prog_node: *std.Progress.Node) !void {
        _ = prog_node;
        const self = @fieldParentPtr(MoveFileStep, "step", step);

        for (self.from, self.into) |from, into| {
            std.fs.cwd().rename(from, into) catch {
                std.log.err("Failed to move {s} to {s}", .{ self.from, self.into });
            };
        }
    }
};
