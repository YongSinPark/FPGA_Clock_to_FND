`timescale 1ns / 1ps

module Decoder_2_to_4(
    input [2:0] i_select,
    input i_enable,
    output [3:0] o_digitPosition
    );

    reg [3:0] r_digitPosition;
    assign o_digitPosition = r_digitPosition;

    always @(i_select, i_enable) begin
        if(i_enable) begin
            r_digitPosition = 4'b1111;
        end
        else begin
            case(i_select)
                3'h0 : r_digitPosition = 4'b1110;
                3'h1 : r_digitPosition = 4'b1101;
                3'h2 : r_digitPosition = 4'b1011;
                3'h3 : r_digitPosition = 4'b0111;
                3'h4 : r_digitPosition = 4'b1110;
                3'h5 : r_digitPosition = 4'b1101;
                3'h6 : r_digitPosition = 4'b1011;
                3'h7 : r_digitPosition = 4'b0111;
            endcase
        end
    end
endmodule