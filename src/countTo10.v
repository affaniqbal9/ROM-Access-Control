/*HW-5
Affan Iqbal
UH ID:2431388*/
module countTo10 (
    input  wire clk,
    input  wire rst,     
    input  wire en,
    input  wire tick_in,
    output reg  timeout_out
);
    reg [3:0] roll_reg;

    always @(posedge clk) begin
        if (rst == 1'b0) begin
            roll_reg    <= 0;
            timeout_out <= 0;
        end else begin
		timeout_out<=1'b0;
            if (tick_in && en) begin
                if (roll_reg == 4'd9) begin
                    roll_reg    <= 0;
                    timeout_out <= 1;
                end else begin
                    roll_reg    <= roll_reg + 1;
     
                end
            end 
            end
        end 
endmodule
