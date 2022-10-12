`timescale 1ns / 1ps

module tb_timer_counter();
    reg i_clk = 1'b0;
    reg i_reset;
    wire [6:0] o_hour, o_min, o_sec;
    wire [6:0] o_msec;
    wire w_clk;

    Clock_divider dut0(
        .i_clk(i_clk), 
        .i_reset(i_reset),
        .o_clk(w_clk)
    );

    Time_clock_counter dut1(
        .i_clk(w_clk),
        .i_reset(i_reset),
        .o_hour(o_hour),
        .o_min(o_min), 
        .o_sec(o_sec),
        .o_msec(o_msec)
    );

    always #5 i_clk <= ~i_clk;

    initial begin
        #00 i_reset = 1'b1;
        #10 i_reset = 1'b0;
        #10000000 i_reset = 1'b0;
        #1000 $finish;
    end

endmodule
