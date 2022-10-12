`timescale 1ns / 1ps

module MUX_8_to_1(
    input [3:0] i_a, i_b, i_c, i_d, i_a1, i_b1, i_c1, i_d1,
    input [2:0] i_select,
    output [3:0] o_value
    );

    reg [3:0] r_value;
    assign o_value = r_value;

    always @(*) begin
        case(i_select)
        3'b000 : r_value = i_a;
        3'b001 : r_value = i_b;
        3'b010 : r_value = i_c;
        3'b011 : r_value = i_d; 
        3'b100 : r_value = i_a1;
        3'b101 : r_value = i_b1;
        3'b110 : r_value = i_c1;
        3'b111 : r_value = i_d1;
        endcase
    end

endmodule