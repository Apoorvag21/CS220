`include "multiplexer4to1.v"
module multiplexer4to1_tb;
reg [31:0] I0,I1,I2,I3;
reg [1:0]sel;
wire [31:0]out;
multiplexer4to1 uut(.sel(sel),.I0(I0),.I1(I1),.I2(I2),.I3(I3),.out(out));
integer i;
initial begin
    $monitor("time = %0t sel=0x%0h I0=0x%0h I1=0x%0h I2=0x%0h I3=0x%0h out=0x%0h", $time,sel,I0,I1,I2,I3,out);
end
initial begin
    $dumpfile("multi_4to1.vcd");
    $dumpvars(0,multiplexer4to1_tb);
end
initial begin
sel<=0;
I0 <= $random;
I1 <= $random;
I2 <= $random; 
I3 <= $random;
forever #5 sel=sel+1;
end
initial begin
    #40 $finish;
end

endmodule 