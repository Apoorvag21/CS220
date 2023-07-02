`timescale 1ns / 1ps
`include "q2.v"
module veda_tb;
    reg clk,reset,writeEnable,mode;
    reg [31:0] datain;
    reg [4:0]addressa;
    reg [4:0]addressb;
    wire [31:0] dataout;

    veda dut (
        .clk(clk),
        .reset(reset),
        .writeEnable(writeEnable),
        .mode(mode),
        .datain(datain),
        .addressa(addressa),
        .addressb(addressb),
        .dataout(dataout)
    );

    initial begin
        clk = 0;
        reset = 1;
        forever #1 clk = !clk;
    end

    initial begin
        reset = 0;
        writeEnable = 1;
         mode = 1;
        datain = 42;
        addressa = 0;
        #2;
        addressa=2;
        writeEnable = 0;
       
        addressb = 0;
        #2;
        $display("dataout: %d", dataout);
        #2$finish;
    end
endmodule
