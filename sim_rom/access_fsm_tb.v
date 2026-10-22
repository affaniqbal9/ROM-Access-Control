`timescale 1 ns/100ps

module access_fsm_tb;

    reg clk;
    reg rst;
    reg enter_pulse;
    reg timeout;
    reg [3:0] digit_in;

    wire authenticated;
    wire not_authenticated;
    wire start_game;
    wire game_active;
    wire game_over;
    wire reconfig_timer;

    access_fsm DUT (
        .clk(clk),
        .rst(rst),
        .enter_pulse(enter_pulse),
        .digit_in(digit_in),
        .timeout(timeout),
        .authenticated(authenticated),
        .not_authenticated(not_authenticated),
        .start_game(start_game),
        .game_active(game_active),
        .game_over(game_over),
        .reconfig_timer(reconfig_timer)
    );

    always begin
        clk = 1'b0; #10;
        clk = 1'b1; #10;
    end

    initial begin
        rst = 0;
        enter_pulse = 0;
        timeout = 0;
        digit_in = 0;

        @(posedge clk);
        rst = 1;
        @(posedge clk);

        digit_in = 4'd1;
        enter_pulse = 1; @(posedge clk);
        enter_pulse = 0; @(posedge clk);

        digit_in = 4'd3;
        enter_pulse = 1; @(posedge clk);
        enter_pulse = 0; @(posedge clk);

        digit_in = 4'd8;
        enter_pulse = 1; @(posedge clk);
        enter_pulse = 0; @(posedge clk);

        digit_in = 4'd8;
        enter_pulse = 1; @(posedge clk);
        enter_pulse = 0; @(posedge clk);

        repeat(20) @(posedge clk);


        digit_in = 4'd9;
        enter_pulse = 1; @(posedge clk);
        enter_pulse = 0; @(posedge clk);

        digit_in = 4'd9;
        enter_pulse = 1; @(posedge clk);
        enter_pulse = 0; @(posedge clk);

        digit_in = 4'd9;
        enter_pulse = 1; @(posedge clk);
        enter_pulse = 0; @(posedge clk);

        digit_in = 4'd9;
        enter_pulse = 1; @(posedge clk);
        enter_pulse = 0; @(posedge clk);

		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);
		@(posedge clk);

    end

endmodule
