/*Number Generator
Affan Iqbal
UH ID:2431388*/
module num_gen(
    input  wire clk,        
    input  wire rst,         
    input  wire rng_gen,     
    output reg  [3:0] number
);

    wire feedback;
    assign feedback = number[3] ^ number[2];

    always @(posedge clk) begin
        if (!rst) begin
            number <= 4'd0;
        end 
        else begin
            if (!rng_gen) begin
                if (number == 4'd0)
                    number <= 4'b0001;
                else
                    number <= {number[2:0], feedback}; 
            end
        end
    end

endmodule