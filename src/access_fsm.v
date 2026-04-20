module access_fsm(
	input        clk,
    input        rst,
    input        enter_pulse,
    input  [3:0] digit_in,
    input        timeout,

    output reg   authenticated,
    output reg   not_authenticated,

    output reg   start_game,
    output reg   game_active,
    output reg   game_over,
    output reg   reconfig_timer
);

    // entered digits
    reg [3:0] p1, p2, p3, p4;

    // ROM interface
    reg  [4:0] rom_addr;
    wire [3:0] rom_digit;

    rom_PSWD rom (
        .address(rom_addr),
        .clock(clk),
        .q(rom_digit)
    );

    // capture ROM digits
    reg [3:0] rom_d0, rom_d1, rom_d2, rom_d3;

    // FSM states
    parameter s0            = 5'b00000;
    parameter s1            = 5'b00001;
    parameter s2            = 5'b00010;
    parameter s3            = 5'b00011;

    // READ 0
    parameter check0_set    = 5'b00100;
    parameter check0_w1     = 5'b00101;
    parameter check0_w2     = 5'b00110;
    parameter check0_w3     = 5'b00111;
    parameter check0_cap    = 5'b01000;

    // READ 1
    parameter check1_set    = 5'b01001;
    parameter check1_w1     = 5'b01010;
    parameter check1_w2     = 5'b01011;
    parameter check1_w3     = 5'b01100;
    parameter check1_cap    = 5'b01101;

    // READ 2
    parameter check2_set    = 5'b01110;
    parameter check2_w1     = 5'b01111;
    parameter check2_w2     = 5'b10000;
    parameter check2_w3     = 5'b10001;
    parameter check2_cap    = 5'b10010;

    // READ 3
    parameter check3_set    = 5'b10011;
    parameter check3_w1     = 5'b10100;
    parameter check3_w2     = 5'b10101;
    parameter check3_w3     = 5'b10110;
    parameter check3_cap    = 5'b10111;

    parameter check_done    = 5'b11000;

    parameter reconfig_s    = 5'b11001;
    parameter wait_start    = 5'b11010;
    parameter gameplay_s    = 5'b11011;
    parameter game_over_s   = 5'b11100;

    reg [4:0] state;

    always @(posedge clk) begin
        if (!rst) begin
            state <= s0;
            authenticated     <= 0;
            not_authenticated <= 1;

            start_game     <= 0;
            game_active    <= 0;
            game_over      <= 0;
            reconfig_timer <= 0;

            p1 <= 0; p2 <= 0; p3 <= 0; p4 <= 0;

            rom_addr <= 0;
            rom_d0 <= 0; rom_d1 <= 0; rom_d2 <= 0; rom_d3 <= 0;
        end
        else begin
            // default pulses
            start_game     <= 0;
            game_over      <= 0;
            reconfig_timer <= 0;

            case (state)

                s0: begin
                    game_active <= 0;
                    if (enter_pulse) begin
                        p1    <= digit_in;
                        state <= s1;
                    end
                end

                s1: if (enter_pulse) begin
                        p2    <= digit_in;
                        state <= s2;
                    end

                s2: if (enter_pulse) begin
                        p3    <= digit_in;
                        state <= s3;
                    end

                s3: if (enter_pulse) begin
                        p4    <= digit_in;
                        state <= check0_set;
                    end

                
                check0_set: begin rom_addr <= 5'd0; state <= check0_w1; end
                check0_w1:  state <= check0_w2;
                check0_w2:  state <= check0_w3;
                check0_w3:  state <= check0_cap;
                check0_cap: begin rom_d0 <= rom_digit; state <= check1_set; end

                
                check1_set: begin rom_addr <= 5'd1; state <= check1_w1; end
                check1_w1:  state <= check1_w2;
                check1_w2:  state <= check1_w3;
                check1_w3:  state <= check1_cap;
                check1_cap: begin rom_d1 <= rom_digit; state <= check2_set; end

                
                check2_set: begin rom_addr <= 5'd2; state <= check2_w1; end
                check2_w1:  state <= check2_w2;
                check2_w2:  state <= check2_w3;
                check2_w3:  state <= check2_cap;
                check2_cap: begin rom_d2 <= rom_digit; state <= check3_set; end

                
                check3_set: begin rom_addr <= 5'd3; state <= check3_w1; end
                check3_w1:  state <= check3_w2;
                check3_w2:  state <= check3_w3;
                check3_w3:  state <= check3_cap;
                check3_cap: begin rom_d3 <= rom_digit; state <= check_done; end

                
                check_done: begin
                    if (p1 == rom_d0 &&
                        p2 == rom_d1 &&
                        p3 == rom_d2 &&
                        p4 == rom_d3)
                    begin
                        authenticated     <= 1;
                        not_authenticated <= 0;
                        state             <= reconfig_s;
								$display("%d","%d","%d","%d", p1,p2,p3,p4);
                    end
                    else begin
                        authenticated     <= 0;
                        not_authenticated <= 1;
                        state             <= s0;
                    end
                end

               
                reconfig_s: begin
                    reconfig_timer <= 1;
                    state          <= wait_start;
                end

                wait_start: begin
                    if (enter_pulse) begin
                        start_game  <= 1;
                        game_active <= 1;
                        state       <= gameplay_s;
                    end
                end

                gameplay_s: begin
                    game_active <= 1;
                    if (timeout) begin
                        game_over   <= 1;
                        game_active <= 0;
                        state       <= game_over_s;
                    end
                end

                game_over_s: begin
                    if (enter_pulse)
                        state <= reconfig_s;
                end

            endcase
        end
    end

endmodule

