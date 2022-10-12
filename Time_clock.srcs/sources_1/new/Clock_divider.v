`timescale 1ns / 1ps

module Clock_divider(
    input i_clk, i_reset,
    output o_clk
    );
    reg [31:0] r_counter = 0;
    reg r_clk = 0;
    assign o_clk = r_clk;

    always @(posedge i_clk, posedge i_reset) begin
        if(i_reset) begin
            r_clk <= 0;
            r_counter <= 0;
        end
        else begin
            //100_000_000 / 100_000 * 2 - 1
            if(r_counter == 50_000 - 1) begin
                r_counter <= 0;
                r_clk = ~ r_clk;
            end
            else begin
                r_counter <= r_counter + 1;
            end   
        end
    end
endmodule
