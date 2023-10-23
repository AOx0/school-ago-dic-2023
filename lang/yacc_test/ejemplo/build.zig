const std = @import("std");
const os = std.os;

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Flex + Bison
    const flex = b.addSystemCommand(&.{ "flex", "-L", "src/lexer.l" });
    const bison = b.addSystemCommand(&.{ "bison", "-l", "src/grammar.y" });

    // Dummy flex
    const gen_dflex = b.addSystemCommand(&.{ "flex", "-L", "src/ddlexer.l" });
    const mir_dflex = b.step("dummy", "Generar un analizador lexico de juguete");
    mir_dflex.makeFn = makeDummyLexer;
    gen_dflex.step.dependOn(mir_dflex);

    const flags = .{ "-W", "-Wall", "-Wextra", "-Werror", "-pedantic-errors" };

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
        gen_step.dependOn(&flex.step);
        gen_step.dependOn(&bison.step);
        gen_step.dependOn(&gen_dflex.step);
    }

    {
        const lexer = b.addExecutable(.{ .name = "lexer", .target = target, .optimize = optimize });

        lexer.linkLibC();
        lexer.addCSourceFiles(&.{ "src/dlexer.c", "src/ddlexer.c", "src/parser.c" }, &flags);
        lexer.step.dependOn(&flex.step);
        lexer.step.dependOn(&bison.step);
        lexer.step.dependOn(&gen_dflex.step);

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
        exe.step.dependOn(&flex.step);
        exe.step.dependOn(&bison.step);
        exe.step.dependOn(&gen_dflex.step);

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
