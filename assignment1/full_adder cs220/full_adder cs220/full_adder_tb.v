`include "full_adder.v"
module full_adder_tb;
reg a,b,cin;
wire cout, sum;
full_adder uut(.a(a),.b(b),.cin(cin),.cout(cout),.sum(sum));
initial begin
    $dumpfile("full_tb.vcd");
    $dumpvars(0,full_adder_tb);
end

initial begin a=1'b1;  #4; a=1'b0;#10 $stop();end
initial begin b=1'b1; forever #2 b=~b;end
initial begin cin=1'b1;forever #1 cin=~cin; #10 $stop();end
initial begin $monitor(" time=%0d A=%b B=%b Cin=%b Sum=%b Cout=%b",$time,a,b,cin,sum,cout);end
endmodule