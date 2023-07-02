module veda (
    clk,reset,writeEnable,address,datain,dataout,mode
);
input clk,reset,writeEnable,mode;
input [31:0] datain;
input [4:0]address;
reg [4:0]add;
output reg [31:0]dataout;
reg [31:0]memory[31:0];
integer i;
always @(posedge clk) begin
    if (reset==1) begin
        for(i=0;i<32;i=i+1)
        begin
            memory[i]=0;
        end
    end

    if(mode==1&&writeEnable==1)
    begin
        memory[address]=datain;
    end
    add=address;
end
always @(posedge clk) begin
    dataout=memory[add];
end
endmodule