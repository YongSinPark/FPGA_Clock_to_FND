`timescale 1ns / 1ps

module Time_clock_counter(
    input i_clk,
    input i_reset,
    output [6:0] o_hour, o_min, o_sec, 
    output [6:0] o_msec
    );
    reg [6:0] r_hour = 0, r_min = 0, r_sec = 0;
    reg [9:0] r_msec = 0;

    assign o_hour = r_hour;
    assign o_min = r_min;
    assign o_sec = r_sec;
    assign o_msec = r_msec / 10;

    always @(posedge i_clk, posedge i_reset) begin
        if(i_reset) begin
            r_hour <= 0;
            r_min <= 0;
            r_sec <= 0;
            r_msec <= 0;
        end
        else begin
            if(r_msec == 999) begin
                r_msec <= 0;
                if(r_sec == 59) begin
                    r_sec <= 0;
                    if(r_min == 59) begin
                        r_min <= 0;
                        if(r_hour == 23) begin
                            r_hour <= 0;
                        end
                        else begin
                            r_hour <= r_hour + 1;
                        end
                    end
                    else begin
                        r_min <= r_min + 1;
                    end
                end
                else begin
                    r_sec <= r_sec + 1;
                end
            end
            else begin
                r_msec <= r_msec +1;
            end
        end 
    end

endmodule
