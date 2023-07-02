`include "full_subtract.v"
module full_subtract_32(a,b,bin,d,bout);
input [31:0]a;
input [31:0]b;
input bin;
output [31:0]d;
output bout;
wire carry[31:0];
full_subtract f1(a[0],b[0],bin,d[0],carry[0]);
genvar i;
generate
for(i=1;i<31;i=i+1)begin
     full_subtract f(a[i],b[i],carry[i-1],d[i],carry[i]);
end
endgenerate 
full_subtract f2(a[31],b[31],carry[30],d[31],bout);
endmodule