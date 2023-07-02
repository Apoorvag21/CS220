`include "full_adder.v"
module kby2bitadder(A,B,cin,cout,sum);
parameter n=16;
input[n-1:0] A,B;
input cin;
output [n-1:0]sum;
output cout;
wire [n:0] carry;
assign carry[0]=cin;
genvar i;
generate 
    for(i=0;i<n;i=i+1)
    begin: loop1
full_adder f(A[i],B[i],carry[i],carry[i+1],sum[i]);
    end
endgenerate
assign cout=carry[n]; 
endmodule