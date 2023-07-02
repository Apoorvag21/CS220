`include "kbitadder.v"
module kbitadder_tb;
reg [31:0] a;
reg [31:0] b;
wire [31:0] sum;
wire cout;
kbitadder #(.n(32))uut(.A(A), .B(B),.cout(cout),.sum(sum));
initial begin
$dumpfile("kbitadder.vcd");
$dumpvars(0, kbitadder_tb);
end
initial begin a=20; forever #2 a=a+10; end
initial begin b=10; forever #1 b=b+10; end
initial begin $monitor(" time=%0d A=%b B=%b Sum=%b Cout=%b",$time,a,b,sum,cout);end
initial begin  #50 $finish; end
endmodule 