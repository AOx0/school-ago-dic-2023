const std = @import("std");
const os = std.os;

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const allocator = b.allocator;

    const argv = &[_][]const u8{ "/usr/bin/flex", "-L", "lexer.lex" };
    const result = std.process.Child.exec(.{ .allocator = allocator, .argv = argv }) catch return;
    defer {
        allocator.free(result.stderr);
        allocator.free(result.stdout);
    }
    const argv2 = &[_][]const u8{ "/usr/bin/bison", "-l", "grammar.yacc" };
    const result2 = std.process.Child.exec(.{ .allocator = allocator, .argv = argv2 }) catch return;
    defer {
        allocator.free(result2.stderr);
        allocator.free(result2.stdout);
    }

    switch (result.term) {
        .Exited => |code| if (code != 0) return,
        else => return,
    }
    switch (result2.term) {
        .Exited => |code| if (code != 0) return,
        else => return,
    }

    const exe = b.addExecutable(.{ .name = "yacc", .target = target, .optimize = optimize });

    b.installArtifact(exe);
    exe.linkLibC();
    exe.addCSourceFiles(&.{ "out/lexer.c", "out/parser.c" }, &.{ "-W", "-Wall", "-Wextra" });

    const exec_cmd = b.addRunArtifact(exe);

    exec_cmd.step.dependOn(b.getInstallStep());

    if (b.args) |args| {
        exec_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Ejecutar yacc");
    run_step.dependOn(&exec_cmd.step);
}
