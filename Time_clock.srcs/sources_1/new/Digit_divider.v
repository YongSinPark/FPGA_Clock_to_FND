`timescale 1ns / 1ps

module Digit_divider(
    input [6:0] i_a, i_b,
    output [3:0] o_a, o_b, o_c, o_d
    );
    assign o_a = i_a % 10;
    assign o_b = i_a / 10 % 10;
    assign o_c = i_b % 10;
    assign o_d = i_b / 10 % 10;
endmodule
