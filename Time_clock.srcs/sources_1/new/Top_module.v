`timescale 1ns / 1ps

module Top_module(
    input i_clk, i_reset, i_mode, i_enable,
    output [3:0] o_digit_select,
    output [7:0] o_FND_font
    );
    wire w_clk;
    wire [6:0] w_hour, w_min, w_sec, w_msec;
    wire [3:0] w_a1, w_b1, w_c1, w_d1;
    wire [3:0] w_a2, w_b2, w_c2, w_d2;
    wire [3:0] w_mux_to_mux1, w_mux_to_mux2;
    wire [3:0] w_mux_to_BCD_decoder;
    wire [2:0] w_digit_to_2_4_decoder;
    wire [3:0] w_FND_DP;

    Clock_divider Clock_divider(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk(w_clk)
    );

    Fnd_couner Fnd_couner(
    .i_clk(w_clk),
    .i_reset(i_reset),
    .o_counter(w_digit_to_2_4_decoder)
    );

    Decoder_2_to_4 Decoder_2_to_4(
    .i_select(w_digit_to_2_4_decoder),
    .i_enable(i_enable),
    .o_digitPosition(o_digit_select)
    );

    Time_clock_counter Time_clock_counter(
    .i_clk(w_clk),
    .i_reset(i_reset),
    .o_hour(w_hour), 
    .o_min(w_min), 
    .o_sec(w_sec),
    .o_msec(w_msec)
    );

    Digit_divider Digit_divider1(
    .i_a(w_hour), 
    .i_b(w_min),
    .o_a(w_a1), 
    .o_b(w_b1), 
    .o_c(w_c1), 
    .o_d(w_d1)
    );

    Digit_divider Digit_divider2(
    .i_a(w_sec), 
    .i_b(w_msec),
    .o_a(w_a2), 
    .o_b(w_b2), 
    .o_c(w_c2), 
    .o_d(w_d2)
    );

    comparator comparator(
    .i_msec(w_msec),
    .o_FND_DP(w_FND_DP)
    );

    MUX_8_to_1 MUX_8_to_1_1(
    .i_a(w_c1), 
    .i_b(w_d1), 
    .i_c(w_a1), 
    .i_d(w_b1),
    .i_a1(11), 
    .i_b1(11), 
    .i_c1(w_FND_DP), 
    .i_d1(11),
    .i_select(w_digit_to_2_4_decoder),
    .o_value(w_mux_to_mux1)
    );

    MUX_8_to_1 MUX_8_to_1_2(
    .i_a(w_c2), 
    .i_b(w_d2), 
    .i_c(w_a2), 
    .i_d(w_b2),
    .i_a1(11), 
    .i_b1(11), 
    .i_c1(w_FND_DP), 
    .i_d1(11),
    .i_select(w_digit_to_2_4_decoder),
    .o_value(w_mux_to_mux2)
    );

    MUX_2_to_1 MUX_2_to_1(
    .i_a(w_mux_to_mux2), 
    .i_b(w_mux_to_mux1),
    .i_select(i_mode),
    .o_data(w_mux_to_BCD_decoder)
    );

    Decoder_BCD_to_FND Decoder_BCD_to_FND(
    .i_value(w_mux_to_BCD_decoder),
    .i_enable(i_enable),
    .o_FND_value(o_FND_font)
    );
endmodule
