module ButtonShaper(b_in, clk, b_out,rst);
input wire b_in, clk,rst;
output reg b_out;
parameter INIT=0, PULSE=1, WAIT=2;
reg [1:0] State, NextState;
always@(State, b_in)
begin
case(State)
	INIT:
	  begin
	  b_out=1'b0;
	  if(b_in==0)
		NextState=PULSE;
	  else
		NextState=INIT;
	  end
	PULSE:
	  begin
	 	 b_out=1'b1;
	 	 NextState=WAIT;
	  end
	WAIT:
	  begin
		b_out=1'b0;
		if(b_in==0)
				NextState=WAIT;
		else
				NextState= INIT;
	  	end
		endcase
	end

always@(posedge clk)
	begin
		if(rst==0)
			State<=INIT;
		else
			State<=NextState;
		end
endmodule