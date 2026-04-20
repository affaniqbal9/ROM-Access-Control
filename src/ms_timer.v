/*ms_timer
Affan Iqbal
UH ID:2431388*/
module ms_timer (
    		input  wire clk,
		input  wire rst,
		input  wire en,
		output reg  timeout_out
	);
		wire feedback; reg [15:0] lfsr_reg;
		assign feedback = lfsr_reg[15] ^ lfsr_reg[13] ^ lfsr_reg[12] ^ lfsr_reg[10];

		always @(posedge clk) begin
			if (rst == 1'b0) begin
				lfsr_reg    <= 16'h0001;
				timeout_out <= 1'b0;
			end else begin
				timeout_out <= 1'b0;

				if (en) begin
					lfsr_reg[15] <= lfsr_reg[14];
					lfsr_reg[14] <= lfsr_reg[13];
					lfsr_reg[13] <= lfsr_reg[12];
					lfsr_reg[12] <= lfsr_reg[11];
					lfsr_reg[11] <= lfsr_reg[10];
					lfsr_reg[10] <= lfsr_reg[9];
					lfsr_reg[9]  <= lfsr_reg[8];
					lfsr_reg[8]  <= lfsr_reg[7];
					lfsr_reg[7]  <= lfsr_reg[6];
					lfsr_reg[6]  <= lfsr_reg[5];
					lfsr_reg[5]  <= lfsr_reg[4];
					lfsr_reg[4]  <= lfsr_reg[3];
					lfsr_reg[3]  <= lfsr_reg[2];
					lfsr_reg[2]  <= lfsr_reg[1];
					lfsr_reg[1]  <= lfsr_reg[0];
					lfsr_reg[0]  <= feedback;

					if (lfsr_reg == 16'hD887) begin
						timeout_out <= 1'b1;
						lfsr_reg    <= 16'h0001; 
					end
				end 
			end
		end
	endmodule
