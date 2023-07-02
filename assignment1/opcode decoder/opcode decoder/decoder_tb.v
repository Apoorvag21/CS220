`include "decoder.v"
module decoder_tb;
wire [7:0] out;
reg en;
reg [2:0] in;
integer i;

decoder uut(in,out,en);
initial begin
    $dumpfile("decoder.vcd");
    $dumpvars(0,decoder_tb);
end
initial begin  
 $monitor( "en=%b, in=%d, out=%b ", en, in, out);
end
initial begin
    for ( i=0; i<16; i=i+1) 
        begin
           {en,in}  = i;
            #1;
        end
end
endmodule