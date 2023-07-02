`include "full_adder_32.v"
module full_adder_32_tb;
reg [31:0] a;
reg [31:0] b;
reg cin;
wire [31:0] sum;
wire cout;
reg flag=0;
full_adder_32 uut(.a(a), .b(b), .cin(cin),.cout(cout),.sum(sum));
initial begin
$dumpfile("full_32.vcd");
$dumpvars(0, full_adder_32_tb);
end
initial begin a=32'b01010101010101010101010101010101; forever #2 a=~a;#10 $finish;end
initial begin b=32'b10101010101010101010101010101010; forever #1 b=~b;#10 $finish;end
initial begin cin=1'b0 ;#10 $finish; end

initial begin $monitor(" time=%0d A=%b B=%b Cin=%b Sum=%b Cout=%b",$time,a,b,cin,sum,cout);end
endmodule 
