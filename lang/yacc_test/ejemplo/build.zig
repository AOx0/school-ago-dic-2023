const std = @import("std");
const os = std.os;

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const cwd = std.fs.cwd();

    cwd.access("out", .{}) catch {
        cwd.makeDir("out") catch {
            const stddeb = std.io.getStdOut().writer();
            stddeb.print("Failed to create {any}/out", .{cwd}) catch return;
        };
    };

    const argv = &[_][]const u8{ "/usr/bin/flex", "-L", "lexer.lex" };
    const argv2 = &[_][]const u8{ "/usr/bin/bison", "-l", "grammar.yacc" };

    const flex = b.addSystemCommand(argv);
    const bison = b.addSystemCommand(argv2);

    const exe = b.addExecutable(.{ .name = "yacc", .target = target, .optimize = optimize });
    b.installArtifact(exe);
    exe.linkLibC();
    exe.addCSourceFiles(&.{ "out/lexer.c", "out/parser.c" }, &.{ "-W", "-Wall", "-Wextra" });
    exe.step.dependOn(&bison.step);
    exe.step.dependOn(&flex.step);

    const run_cmd = b.addRunArtifact(exe);

    run_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Ejecutar yacc");
    run_step.dependOn(&run_cmd.step);
}
