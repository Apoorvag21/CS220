`include "half_adder.v"
module full_adder(a,b,cin,cout,sum);
input a,b,cin;
output cout,sum;
wire s_1,cout_1,cout_2;
half_adder hlf1(a,b,s_1,cout_1);
half_adder hlf2(cin,s_1,sum,cout_2);
or o1(cout,cout_2,cout_1);
endmodule