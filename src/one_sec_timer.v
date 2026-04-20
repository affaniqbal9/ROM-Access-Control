/*HW-5
Affan Iqbal
UH ID:2431388
Top module*/
module one_sec_timer (
    input  wire clk,
    input  wire rst,     // active-low
    input  wire en,
    output wire timeout_1s
);
    wire tick_1ms;
    wire tick_100ms;


    // 1 ms generator (50,000 clock cycles)
    ms_timer u_ms_timer_lfsr (
        .clk(clk),
        .rst(rst),
        .en(en),
        .timeout_out(tick_1ms)
    );

    // 100 ms generator (100 × 1 ms ticks)
    countTo100 u_countTo100 (
        .clk(clk),
        .rst(rst),
        .en(en),
        .tick_in(tick_1ms),
        .timeout_out(tick_100ms)
    );

    // 1 second generator (10 × 100 ms ticks)
    countTo10 u_countTo10 (
        .clk(clk),
        .rst(rst),
        .en(en),
        .tick_in(tick_100ms),
        .timeout_out(timeout_1s)
    );

endmodule