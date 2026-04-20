/* Seven Segment Decoder
Affan Iqbal | UH ID:2431388*/

/*      ---a---
       |       |
       f       b
       |       |
        ---g---      7 Segment Display
       |       |
       e       c   
       |       |
        ---d---
*/

module SevenSegmentDecoder(A, segmnt); 
	input [3:0] A; /* 4-bit input */ 
	output [6:0] segmnt; /* 7-segment output */ 
	reg [6:0] segmnt;
 
		always @(*) begin
			case (A)           /* gfedcba*/      
				4'h0: segmnt = 7'b1000000; /*0*/
				4'h1: segmnt = 7'b1111001; /*1*/
				4'h2: segmnt = 7'b0100100; /*2*/
				4'h3: segmnt = 7'b0110000; /*3*/
				4'h4: segmnt = 7'b0011001; /*4*/
				4'h5: segmnt = 7'b0010010; /*5*/
				4'h6: segmnt = 7'b0000010; /*6*/
				4'h7: segmnt = 7'b1111000; /*7*/
				4'h8: segmnt = 7'b0000000; /*8*/
				4'h9: segmnt = 7'b0010000; /*9*/
				4'hA: segmnt = 7'b0001000; /* A */ 
				4'hB: segmnt = 7'b0000011; /* b */ 
				4'hC: segmnt = 7'b1000110; /* C */ 
				4'hD: segmnt = 7'b0100001; /* d */ 
				4'hE: segmnt = 7'b0000110; /* E */ 
				4'hF: segmnt = 7'b0001110; /* F */
				default: segmnt = 7'b1111111;
        endcase
    end

endmodule
