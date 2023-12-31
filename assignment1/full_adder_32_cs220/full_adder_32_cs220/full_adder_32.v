`include "full_adder.v"
module full_adder_32(a,b,cin,cout,sum);
integer i;
input [31:0]a;
input [31:0]b;
input cin;
output cout;
output [31:0] sum;
wire [31:0]carry;
full_adder f1(a[0],b[0],cin,carry[0],sum[0]);
full_adder f2(a[1],b[1],carry[0],carry[1],sum[1]);
full_adder f3(a[2],b[2],carry[1],carry[2],sum[2]);
full_adder f4(a[3],b[3],carry[2],carry[3],sum[3]);
full_adder f5(a[4],b[4],carry[3],carry[4],sum[4]);
full_adder f6(a[5],b[5],carry[4],carry[5],sum[5]);
full_adder f7(a[6],b[6],carry[5],carry[6],sum[6]);
full_adder f8(a[7],b[7],carry[6],carry[7],sum[7]);
full_adder f9(a[8],b[8],carry[7],carry[8],sum[8]);
full_adder f10(a[9],b[9],carry[8],carry[9],sum[9]);
full_adder f11(a[10],b[10],carry[9],carry[10],sum[10]);
full_adder f12(a[11],b[11],carry[10],carry[11],sum[11]);
full_adder f13(a[12],b[12],carry[11],carry[12],sum[12]);
full_adder f14(a[13],b[13],carry[12],carry[13],sum[13]);
full_adder f15(a[14],b[14],carry[13],carry[14],sum[14]);
full_adder f16(a[15],b[15],carry[14],carry[15],sum[15]);
full_adder f17(a[16],b[16],carry[15],carry[16],sum[16]);
full_adder f18(a[17],b[17],carry[16],carry[17],sum[17]);
full_adder f19(a[18],b[18],carry[17],carry[18],sum[18]);
full_adder f20(a[19],b[19],carry[18],carry[19],sum[19]);
full_adder f21(a[20],b[20],carry[19],carry[20],sum[20]);
full_adder f22(a[21],b[21],carry[20],carry[21],sum[21]);
full_adder f23(a[22],b[22],carry[21],carry[22],sum[22]);
full_adder f24(a[23],b[23],carry[22],carry[23],sum[23]);
full_adder f25(a[24],b[24],carry[23],carry[24],sum[24]);
full_adder f26(a[25],b[25],carry[24],carry[25],sum[25]);
full_adder f27(a[26],b[26],carry[25],carry[26],sum[26]);
full_adder f28(a[27],b[27],carry[26],carry[27],sum[27]);
full_adder f29(a[28],b[28],carry[27],carry[28],sum[28]);
full_adder f30(a[29],b[29],carry[28],carry[29],sum[29]);
full_adder f31(a[30],b[30],carry[29],carry[30],sum[30]);
full_adder f32(a[31],b[31],carry[30],cout,sum[31]);
endmodule