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
    const mir_dflex = b.addSystemCommand(&.{ "sh", "./scripts/copy_lexer.sh" });
    gen_dflex.step.dependOn(&mir_dflex.step);

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
    }

    {
        const gen_step = b.step("gen", "Generar lexer.{c,h}, parser.{c, h}");
        gen_step.dependOn(&flex.step);
        gen_step.dependOn(&bison.step);
        if (!target.isWindows()) gen_step.dependOn(&gen_dflex.step);
    }

    {
        const exe = b.addExecutable(.{ .name = "main", .target = target, .optimize = optimize });
        b.installArtifact(exe);

        exe.linkLibC();
        exe.addCSourceFiles(&.{ "src/main.c", "src/lexer.c", "src/parser.c" }, &flags);
        exe.step.dependOn(&flex.step);
        exe.step.dependOn(&bison.step);
        if (!target.isWindows()) exe.step.dependOn(&gen_dflex.step);

        const run_cmd = b.addRunArtifact(exe);
        run_cmd.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd.addArgs(args);

        const run_step = b.step("run", "Ejecutar el programa final");
        run_step.dependOn(&run_cmd.step);
    }
}
