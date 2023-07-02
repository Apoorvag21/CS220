`include "full_subtract_32.v"
module full_subtract_32_tb;
reg [31:0] a;
reg [31:0] b;
reg bin;
wire [31:0] d;
wire bout;
full_subtract_32 uut(.a(a), .b(b), .bin(bin),.d(d),.bout(bout));
initial begin
$dumpfile("full_sub_32.vcd");
$dumpvars(0, full_subtract_32_tb);
end
initial begin a=32'b01010101010101010101010101010101; forever #2 a=~a;#10 $finish;end
initial begin b=32'b10101010101010101010101010101010; forever #1 b=~b;#10 $finish;end
initial begin bin=1'b0 ;#10 $finish; end

initial begin $monitor(" time=%0d A=%b B=%b bin=%b d=%b bout=%b",$time,a,b,bin,d,bout);end
endmodule 
