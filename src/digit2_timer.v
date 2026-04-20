module digit2_timer (
    input  wire clk,
    input  wire rst,
    input  wire pass_in,          
    input  wire enable_timer,     
    input  wire one_sec_pulse,    
    output wire timeout,
    output wire [3:0] tens,
    output wire [3:0] ones
);
    wire borrow_up_ones;
    wire borrow_up_tens;
    wire no_borrow_down_ones;
    wire no_borrow_down_tens;
    // ONES digit
    digit_timer ones_digit (
        .clk            (clk),
        .rst            (rst),
        .reconfig       (pass_in),
        .borrow_down    (one_sec_pulse),
        .no_borrow_up   (no_borrow_down_tens),
        .borrow_up      (borrow_up_ones),
        .no_borrow_down (no_borrow_down_ones),
        .digit_out      (ones)
    );
    // TENS digit
    digit_timer tens_digit (
        .clk            (clk),
        .rst            (rst),
        .reconfig       (pass_in),
        .borrow_down    (borrow_up_ones),
        .no_borrow_up   (1'b1),
        .borrow_up      (borrow_up_tens),
        .no_borrow_down (no_borrow_down_tens),
        .digit_out      (tens)
    );
    assign timeout = no_borrow_down_ones;
endmodule
