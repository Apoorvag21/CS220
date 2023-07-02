`include "full_subtract.v"
module full_subtract_tb;
reg a,b,bin;
wire d, bout;
full_subtract uut(.a(a),.b(b),.bin(bin),.d(d),.bout(bout));
// inputs are reg and outputs are wire
initial begin 
    $dumpfile("full_subtract.vcd");
    $dumpvars(0,full_subtract_tb);
end
initial begin a=1'b1;  #4; a=1'b0;#10 $stop();end
initial begin b=1'b1; forever #2 b=~b;end
initial begin bin=1'b1;forever #1 bin=~bin; #10 $finish();end
initial begin $monitor(" time=%0d A=%b B=%b bin=%b Sum=%b bout=%b",$time,a,b,bin,d,bout);end
endmodule

