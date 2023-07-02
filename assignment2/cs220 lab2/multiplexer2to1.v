module multiplexer2to1(s,a,b,out);
parameter w=4;
input s;
input [w-1:0] a, b;
output [w-1:0] out;
assign out = s?b:a;
endmodule 