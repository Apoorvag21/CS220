`include "half_subtract.v"
module full_subtract(a,b,bin,d,bout);
input a,b,bin;
output d,bout;
wire dif1,carry1,carry2;
half_subtract hf1(a,b,dif1,carry1);
half_subtract hf2(dif1,bin,d,carry2);
or o1(bout,carry1,carry2);
endmodule 