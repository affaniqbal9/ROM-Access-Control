/*HW-5
Affan Iqbal
UH ID:2431388*/
module countTo100 (
    input  wire clk,
    input  wire rst,     
    input  wire en,
    input  wire tick_in,
    output reg  timeout_out
);
    reg [6:0] stage_reg;

    always @(posedge clk) begin
        if (rst == 1'b0) begin
            stage_reg    <= 0;
            timeout_out <= 0;
        end else begin
		timeout_out<=1'b0;
            if (tick_in && en) begin
                if (stage_reg == 7'd99) begin
                    stage_reg    <= 0;
                    timeout_out <= 1;
                end else begin
                    stage_reg    <= stage_reg + 1;
     
                end
            end 
            end
        end 
endmodule