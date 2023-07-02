`include "veda.v"
module tb();

reg clk, reset, writeEnable, mode;
reg [31:0] datain;
reg [4:0] address;
wire [31:0] dataout;

veda uut (
    .clk(clk),
    .reset(reset),
    .writeEnable(writeEnable),
    .address(address),
    .datain(datain),
    .dataout(dataout),
    .mode(mode)
);

initial begin
    clk = 0;
    reset = 1;
    #2 reset = 0;
end

always #1 clk = ~clk;

initial begin
    $dumpfile("tb.vcd");
    $dumpvars(1,tb);
    // write to memory location 5 with data 0x12345678
    address = 5;
    datain = 32'h12345678;
    writeEnable = 1;
    mode = 1;
    #2;

    // read from memory location 5
    address = 5;
    writeEnable = 0;
    #2;

    // check if dataout is equal to 0x12345678
    
    
    $monitor(dataout);
if(dataout==32'h12345678)
begin
    $display("hi");
end
else $display("bye");
    // write to memory location 10 with data 0xabcdef01
    address = 10;
    datain = 32'habcdef01;
    writeEnable = 1;
    mode = 1;
    #2;

    // read from memory location 10
    address = 10;
    writeEnable = 0;
    #2;
if(dataout==32'habcdef01)
begin
    $display("hi");
end
else $display("bye");
    

    $finish;
end

endmodule
