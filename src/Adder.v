/* 4-bit Adder 
   Affan */

module FourBitAdder(A, B, Sum);

    input  [3:0] A, B;  //input
    output [3:0] Sum;    //output
    reg    [3:0] Sum;

    always @(A or B)
        begin
            Sum = A + B; //sum
        end

endmodule

