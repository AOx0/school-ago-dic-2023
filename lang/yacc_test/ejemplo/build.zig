const std = @import("std");
const os = std.os;

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    // Flex + Bison
    const flex = b.addSystemCommand(&.{ "flex", "-L", "src/lexer.l" });
    const bison = b.addSystemCommand(&.{ "bison", "-l", "src/grammar.y" });

    // Dummy flex
    const mir_dflex = b.addSystemCommand(&.{ "sh", "./scripts/copy_lexer.sh" });
    const gen_dflex = b.addSystemCommand(&.{ "flex", "-L", "src/ddlexer.l" });
    gen_dflex.step.dependOn(&mir_dflex.step);

    const lib = b.addStaticLibrary(.{
        .name = "bison",
        .target = target,
        .optimize = optimize,
    });
    b.installArtifact(lib);
    lib.addCSourceFiles(&.{ "src/lexer.c", "src/parser.c" }, &.{});
    lib.linkLibC();
    lib.step.dependOn(&flex.step);
    lib.step.dependOn(&bison.step);
    lib.strip = true;

    {
        const gen_step = b.step("gen", "Generar lexer.{c,h}, parser.{c, h}");
        gen_step.dependOn(&flex.step);
        gen_step.dependOn(&bison.step);
        gen_step.dependOn(&gen_dflex.step);
    }

    {
        const clean = b.addSystemCommand(&.{ "sh", "./scripts/clean.sh" });
        const clean_step = b.step("clean", "cleanerar lexer.{c,h}, parser.{c, h}");
        clean_step.dependOn(&clean.step);
    }

    {
        const exe = b.addExecutable(.{ .name = "main", .target = target, .optimize = optimize });
        b.installArtifact(exe);

        exe.linkLibC();
        exe.addCSourceFiles(&.{"src/main.c"}, &.{ "-W", "-Wall", "-Wextra" });
        exe.linkLibrary(lib);

        const run_cmd = b.addRunArtifact(exe);
        run_cmd.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd.addArgs(args);

        const run_step = b.step("run", "Ejecutar el programa final");
        run_step.dependOn(&run_cmd.step);
    }

    {
        const lexer = b.addExecutable(.{ .name = "lexer", .target = target, .optimize = optimize });

        lexer.linkLibC();
        lexer.addCSourceFiles(&.{ "src/ddlexer.c", "src/dlexer.c", "src/parser.c" }, &.{ "-W", "-Wall", "-Wextra" });
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
