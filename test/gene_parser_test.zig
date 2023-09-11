const stdx = @import("stdx");
const t = stdx.testing;

const cy = @import("../src/cyber.zig");

test "Parser" {
    var parser = cy.GeneParser.init(t.alloc);
    defer parser.deinit();

    var res = try parser.parseNoErr(
        \\1
    );
    _ = res;
    // try t.eq(res, 1);
}
