module Lab4_IQBAL_affan(
    input  wire        clk,
    input  wire        rst, 

    input  wire        pass_btn, 
    input  wire        load_btn, 
    input  wire        rng_btn, 

    input  wire [3:0]  player_in1,
    input  wire [3:0]  pass_sw,

    output reg  [6:0]  disp_player1,   
    output reg  [6:0]  disp_rng,       
    output reg  [6:0]  disp_sum,       
    output reg  [6:0]  disp_hex3,      
    output reg  [6:0]  disp_time_ones, 
    output reg  [6:0]  disp_time_tens, 

    output reg         led_nomatch,
    output reg         led_match,
    output reg         led_logged_in,
    output reg         led_logged_out
);

    wire pass_pulse, load_pulse;
    wire authenticated, not_authenticated;
    wire rng_gate, load_out, timer_reconfig, timer_enable;

    wire [3:0] rng_value, player_val, sum_val;
    wire one_sec_pulse, timeout;
    wire [3:0] time_tens, time_ones;

    wire [6:0] seg_player, seg_rng, seg_sum, seg_tens, seg_ones;
	 wire pass_btn_active_high = ~pass_btn;
	 

    reg [3:0] score_tens = 4'd0;
    reg [3:0] score_ones = 4'd0;

    wire [6:0] seg_score_tens;
    wire [6:0] seg_score_ones;

    wire inc_score = load_out & (sum_val == 4'b1111) & timer_enable;


    reg show_score;

    always @(posedge clk) begin
        if (!rst) begin
            show_score <= 1'b0;
        end
        else begin
            if (timeout)
                show_score <= 1'b1;       
            else if (timer_reconfig)
                show_score <= 1'b0;      
        end
    end

   
    ButtonShaper btn_load(load_btn, clk, load_pulse, rst);
	 ButtonShaper btn_pass(pass_btn_active_high, clk, pass_pulse, rst);


    access_controller auth_core(
        clk, rst, pass_pulse, rng_btn, load_pulse, pass_sw, timeout, 1'b0,
        authenticated, not_authenticated, rng_gate, load_out,
        timer_reconfig, timer_enable
    );

    num_gen rng_core(clk, rst, rng_gate, rng_value);

    LoadRegister reg_player(player_in1, player_val, clk, rst, load_out);

    one_sec_timer one_sec_core(clk, rst, timer_enable, one_sec_pulse);

    digit2_timer game_timer(
        .clk(clk), .rst(rst), .pass_in(timer_reconfig),
        .enable_timer(timer_enable), .one_sec_pulse(one_sec_pulse),
        .timeout(timeout), .tens(time_tens), .ones(time_ones)
    );

    FourBitAdder adder_core(player_val, rng_value, sum_val);

    SevenSegmentDecoder seg_player_dec(player_val, seg_player);
    SevenSegmentDecoder seg_rng_dec(rng_value, seg_rng);
    SevenSegmentDecoder seg_sum_dec(sum_val, seg_sum);
    SevenSegmentDecoder seg_tens_dec(time_tens, seg_tens);
    SevenSegmentDecoder seg_ones_dec(time_ones, seg_ones);

    SevenSegmentDecoder score_tens_dec(score_tens, seg_score_tens);
    SevenSegmentDecoder score_ones_dec(score_ones, seg_score_ones);

    always @(posedge clk) begin
        if (!rst || timer_reconfig) begin
            score_tens <= 4'd0;
            score_ones <= 4'd0;
        end
        else if (inc_score) begin
            if (score_ones == 4'd9) begin
                score_ones <= 4'd0;
                score_tens <= (score_tens == 4'd9) ? 4'd0 : score_tens + 4'd1;
            end
            else begin
                score_ones <= score_ones + 4'd1;
            end
        end
    end

    always @(posedge clk) begin
        if (!rst) begin
            disp_player1    <= 7'b1111111;
            disp_rng        <= 7'b1111111;
            disp_sum        <= 7'b1111111;
            disp_hex3       <= 7'b1111111;
            disp_time_tens  <= 7'b1111111;
            disp_time_ones  <= 7'b1111111;

            led_nomatch     <= 0;
            led_match       <= 1;
            led_logged_in   <= 0;
            led_logged_out  <= 1;
        end
        else begin
            disp_player1 <= seg_player;
            disp_rng     <= seg_rng;

            if (show_score) begin
                disp_sum  <= seg_score_ones;
                disp_hex3 <= seg_score_tens;
            end
            else begin
                disp_sum  <= seg_sum;
                disp_hex3 <= 7'b1111111;
            end

            disp_time_ones <= seg_ones;
            disp_time_tens <= seg_tens;

            led_logged_in  <= authenticated;
            led_logged_out <= not_authenticated;

            led_match      <= (sum_val == 4'b1111);
            led_nomatch    <= ~(sum_val == 4'b1111);
        end
    end

endmodule
