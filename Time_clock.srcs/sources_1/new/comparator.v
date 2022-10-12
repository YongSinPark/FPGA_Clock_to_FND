`timescale 1ns / 1ps

module comparator(
    input [6:0] i_msec,
    output [3:0] o_FND_DP
    );

    assign o_FND_DP = (i_msec < 50) ? 11 : 10;
endmodule
