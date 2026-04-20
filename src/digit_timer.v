module digit_timer (
    input  wire clk,
    input  wire rst,              
    input  wire reconfig,         
    input  wire borrow_down,      
    input  wire no_borrow_up,     
    output reg  borrow_up,        
    output reg  no_borrow_down,   
    output reg [3:0] digit_out
);

    reg [3:0] digit;
    wire allowHold = no_borrow_up;

    always @(posedge clk) begin 
        if (!rst) begin
            digit          <= 4'd0;
            borrow_up      <= 1'b0;
            no_borrow_down <= 1'b0;
        end
        else if (reconfig) begin
            digit          <= 4'd9;
            borrow_up      <= 1'b0;
            no_borrow_down <= 1'b0;
        end
        else begin
            borrow_up      <= 1'b0;

            if (borrow_down) begin
                if (digit > 4'd0) begin
                    digit <= digit - 4'd1;

                    if (digit == 4'd1 && no_borrow_up)
                        no_borrow_down <= 1'b1;
                    else
                        no_borrow_down <= 1'b0;
                end
                else if (digit == 4'd0) begin
                    borrow_up <= 1'b1;

                    if (no_borrow_up)
                        digit <= 4'd0;   
                    else
                        digit <= 4'd9;   
                end
            end
        end

        digit_out <= digit;
    end
endmodule
