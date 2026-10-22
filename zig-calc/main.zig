const std = @import("std");

pub fn main(init: std.process.Init) !void {
    std.debug.print("Welcome to IsaacCodesStuff's Calculator!\n", .{});
    try operation(init);
}

fn operation(init: std.process.Init) !void {
    var stdin_buffer: [1024]u8 = undefined;
    var stdin_reader =
        std.Io.File.stdin().reader(init.io, &stdin_buffer);
    const stdin = &stdin_reader.interface;

    var repeat = true;
    while (repeat == true) {
        std.debug.print("========== IsaacCodesStuff's Calculator ==========\n", .{});

        const operations_list = [_][]const u8{
            "Addition",
            "Subtraction",
            "Multiplication",
            "Division",
            "Exit",
        };

        for (operations_list, 0..) |name, i| {
            std.debug.print("{d}. {s}\n", .{ i + 1, name });
        }

        std.debug.print("Choose operation from above: ", .{});
        const line1 = try stdin.takeDelimiterExclusive('\n');
        stdin.toss(1);
        const choice = std.fmt.parseInt(i32, line1, 10) catch {
            std.debug.print("Invalid operation.\n", .{});
            continue;
        };

        if (choice < 1 or choice > 5) {
            std.debug.print("Invalid operation.\n", .{});
            continue;
        }

        if (choice == 5) {
            std.debug.print("Goodbye!\n", .{});
            return;
        }

        std.debug.print("Enter first number: ", .{});
        const line2 = try stdin.takeDelimiterExclusive('\n');
        stdin.toss(1);
        const num1 = std.fmt.parseInt(i32, line2, 10) catch {
            std.debug.print("Invalid number.\n", .{});
            continue;
        };

        std.debug.print("Enter second number: ", .{});
        const line3 = try stdin.takeDelimiterExclusive('\n');
        stdin.toss(1);
        const num2 = std.fmt.parseInt(i32, line3, 10) catch {
            std.debug.print("Invalid number.\n", .{});
            continue;
        };

        if (choice == 4 and num2 == 0) {
            std.debug.print("Cannot divide by zero.\n", .{});
            continue;
        }

        const total: f64 = switch (choice) {
            1 => @floatFromInt(num1 + num2),
            2 => @floatFromInt(num1 - num2),
            3 => @floatFromInt(num1 * num2),
            4 => @as(f64, @floatFromInt(num1)) / @as(f64, @floatFromInt(num2)),
            else => unreachable,
        };

        std.debug.print("Result: {d}\n", .{total});

        while (true) {
            std.debug.print("Do you wanna try again? ", .{});
            const answer = try stdin.takeDelimiterExclusive('\n');
            stdin.toss(1);

            if (std.mem.eql(u8, answer, "y")) {
                repeat = true;
                break;
            } else if (std.mem.eql(u8, answer, "n")) {
                repeat = false;
                break;
            } else {
                std.debug.print("You had TWO choices, and you chose something else?!\n", .{});
            }
        }
    }
    std.debug.print("Goodbye!\n", .{});
}
