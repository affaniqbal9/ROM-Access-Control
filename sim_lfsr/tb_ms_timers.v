`timescale 1ns/1ps

module tb_ms_timers;

    reg clk;
    reg rst;
    reg en;

    wire timeout_reg;
    wire timeout_lfsr;
    wire [15:0] lfsr_reg;

    // Clock generator (REQUIRED)
    initial begin
        clk = 0;
        forever #10 clk = ~clk;   // 50 MHz clock
    end

    // Reset + enable sequence
    initial begin
        rst = 0;
        en  = 0;

        #50;
        rst = 1;

        #50;
        en = 1;

        #2_000_000;
        //$stop;
    end

    ms_timer u_reg (
        .clk(clk),
        .rst(rst),
        .en(en),
        .timeout_out(timeout_reg)
    );

    ms_timer_lfsr u_lfsr (
        .clk(clk),
        .rst(rst),
        .en(en),
        .timeout_out(timeout_lfsr),
        .lfsr_reg(lfsr_reg)
    );

endmodule
