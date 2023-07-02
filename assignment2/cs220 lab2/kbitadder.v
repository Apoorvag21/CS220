`include "kby2bitadder.v"
`include "multiplexer2to1.v"
module kbitadder(A,B,cout,sum);
parameter n=8;
input [n-1:0] A,B;
output [n-1:0] sum;
output cout;
wire c0,c1,c;
wire [n-1:0] temp_sum;
kby2bitadder #(.n(n/2)) k1(A[n/2-1:0],B[n/2-1:0],1'b0,c,sum[n/2-1:0]);
kby2bitadder #(.n(n/2)) k2(A[n-1:n/2],B[n-1:n/2],1'b0,c0,temp_sum[n/2-1:0]);
kby2bitadder #(.n(n/2)) k3(A[n-1:n/2],B[n-1:n/2],1'b1,c1,temp_sum[n-1:n/2]);
multiplexer2to1 #(.w(1)) m1(c,c0,c1,cout);
multiplexer2to1 #(.w(n/2)) m2(c,temp_sum[n/2-1:0],temp_sum[n-1:n/2],sum[n-1:n/2]);
endmodule