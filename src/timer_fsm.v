module timer_fsm(
    input        clk,
    input        rst,
    input        rng_in,
    input        load_in,

    input        start_game,
    input        game_active,
    input        game_over,
    input        reconfig_timer,

    output reg   rng_out,
    output reg   load_out,
    output reg   timer_reconfig,
    output reg   timer_enable
);

    always @(posedge clk) begin
        if (!rst) begin
            rng_out        <= 1;
            load_out       <= 0;
            timer_reconfig <= 0;
            timer_enable   <= 0;
        end
        else begin

            // Default outputs
            timer_reconfig <= 0;
            timer_enable   <= 0;


            if (reconfig_timer)
                timer_reconfig <= 1;
					 rng_out<=0; //a

            if (game_active) begin
                timer_enable <= 1;
                rng_out      <= rng_in;   
                load_out     <= load_in;
            end
            else begin
                rng_out  <= 1;
                load_out <= 0;
            end
//Game Over
            if (game_over)
                timer_enable <= 0;

        end
    end

endmodule
