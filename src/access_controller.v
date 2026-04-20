module access_controller(
    input        clk,
    input        rst,               
    input        enter_pulse,       
    input        rng_in,            
    input        load_in,           
    input  [3:0] digit_in,          
    input        timeout,           
    input        op,                

    output       authenticated,
    output       not_authenticated,
    output       rng_out,           
    output       load_out,          
    output       timer_reconfig,    
    output       timer_enable       
);
    wire auth_ok;
    wire auth_fail;

    wire start_game;
    wire game_active;
    wire game_over_sig;
    wire reconfig_sig;
	 

    // ACCESS FSM
    access_fsm ACCESS_CORE (
        .clk(clk),
        .rst(rst),
        .enter_pulse(enter_pulse),
        .digit_in(digit_in),
        .timeout(timeout),

        .authenticated(auth_ok),
        .not_authenticated(auth_fail),

        .start_game(start_game),
        .game_active(game_active),
        .game_over(game_over_sig),
        .reconfig_timer(reconfig_sig)
    );

    // TIMER FSM
    timer_fsm TIMER_CORE (
        .clk(clk),
        .rst(rst),
        .rng_in(rng_in),
        .load_in(load_in),

        .start_game(start_game),
        .game_active(game_active),
        .game_over(game_over_sig),
        .reconfig_timer(reconfig_sig),

        .rng_out(rng_out),
        .load_out(load_out),
        .timer_reconfig(timer_reconfig),
        .timer_enable(timer_enable)
    );

    assign authenticated     = auth_ok;
    assign not_authenticated = auth_fail;

endmodule