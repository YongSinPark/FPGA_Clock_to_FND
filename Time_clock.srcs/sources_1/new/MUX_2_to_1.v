`timescale 1ns / 1ps

module MUX_2_to_1(
    input [3:0] i_a, i_b,
    input i_select,
    output [3:0] o_data
    );

    reg [3:0] r_data;
    assign o_data = r_data;

    always @(i_a, i_b, i_select) begin
        case(i_select)
            1'b0 : r_data = i_a;
            1'b1 : r_data = i_b;
        endcase
    end

endmodule