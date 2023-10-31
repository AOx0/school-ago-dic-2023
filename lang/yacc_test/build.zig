const std = @import("std");
const os = std.os;

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});
    const debug_lex = b.option(bool, "debug-lex", "") orelse false;
    const debug_bison = b.option(bool, "debug-bison", "") orelse false;

    std.process.changeCurDir(b.build_root.path.?) catch {
        std.log.err("Failed to set cwd", .{});
        return;
    };

    const mv_flex = MoveFileStep.create(b, &.{"./lex.yy.c"}, &.{"./src/lexer.c"});
    mv_flex.step.dependOn(&b.addSystemCommand(&.{ "flex", if (debug_lex) "-Ld" else "-L", "src/lexer.l" }).step);

    const mv_bison = MoveFileStep.create(b, &.{ "./grammar.tab.c", "./grammar.tab.h" }, &.{ "./src/parser.c", "./src/parser.h" });
    mv_bison.step.dependOn(&b.addSystemCommand(&.{ "bison", if (debug_bison) "-tld" else "-ld", "src/grammar.y" }).step);

    var flags = .{ "-W", "-Wall", "-Wextra", "-Werror", "-pedantic", "-pedantic-errors", "-Wno-error=sign-compare", if (debug_bison) "-DESTA_EN_DEBUG" else "" };

    {
        const exe = b.addExecutable(.{ .name = "main", .target = target, .optimize = optimize });
        b.installArtifact(exe);

        exe.linkLibC();
        exe.addCSourceFiles(&.{ "src/lexer.c", "src/parser.c" }, &.{});
        exe.addCSourceFiles(&.{"src/main.c"}, &flags);
        exe.step.dependOn(&mv_flex.step);
        exe.step.dependOn(&mv_bison.step);

        const run_cmd = b.addRunArtifact(exe);
        run_cmd.step.dependOn(b.getInstallStep());
        if (b.args) |args| run_cmd.addArgs(args);

        const run_step = b.step("run", "Ejecutar el programa final");
        run_step.dependOn(&run_cmd.step);
    }
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
