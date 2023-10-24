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
    const mv_flex = MoveFileStep.create(b, &.{"./lex.yy.c"}, &.{"./src/lexer.c"});
    mv_flex.step.dependOn(&b.addSystemCommand(&.{ "flex", "-L", "src/lexer.l" }).step);

    const mv_bison = MoveFileStep.create(b, &.{ "./grammar.tab.c", "./grammar.tab.h" }, &.{ "./src/parser.c", "./src/parser.h" });
    mv_bison.step.dependOn(&b.addSystemCommand(&.{ "bison", "-ld", "src/grammar.y" }).step);

    // Dummy flex
    const gen_dflex = b.addSystemCommand(&.{ "flex", "-L", "src/ddlexer.l" });
    const mir_dflex = b.step("dummy", "Generar un analizador lexico de juguete");
    const mv_dflex = MoveFileStep.create(b, &.{"./lex.dd.c"}, &.{"./src/ddlexer.c"});
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
        lexer.addCSourceFiles(&.{ "src/ddlexer.c", "src/parser.c" }, &.{});
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
        exe.addCSourceFiles(&.{ "src/lexer.c", "src/parser.c" }, &.{});
        exe.addCSourceFiles(&.{"src/main.c"}, &flags);
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

    var contents: [20_000]u8 = .{};
    var main_contents: [5_000]u8 = .{};
    var final: [25_000]u8 = .{};

    var main_file = try std.fs.cwd().openFile("src/dlexer.c", .{ .mode = .read_only });
    defer main_file.close();

    var file = try std.fs.cwd().openFile("src/lexer.l", .{ .mode = .read_only });
    defer file.close();

    var dest_file = try std.fs.cwd().createFile("src/ddlexer.l", .{ .truncate = true });
    defer dest_file.close();

    const size = try file.readAll(&contents);
    const main_size = try main_file.readAll(&main_contents);

    const final_size = replaceDummyReturns(contents[0..size], &final);

    @memcpy(final[final_size .. final_size + main_size], main_contents[0..main_size]);

    try dest_file.writeAll(final[0 .. final_size + main_size]);
    _ = progress;
    _ = self;
}

const MoveFileStep = struct {
    const Self = @This();
    step: std.build.Step,
    from: []const []const u8,
    into: []const []const u8,

    pub fn create(b: *std.build.Builder, from: []const []const u8, into: []const []const u8) *MoveFileStep {
        const self = b.allocator.create(Self) catch @panic("out of memory");
        self.* = Self{ .step = std.build.Step.init(.{
            .id = .custom,
            .name = "Move step",
            .owner = b,
            .makeFn = make,
        }), .from = from, .into = into };
        return self;
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
