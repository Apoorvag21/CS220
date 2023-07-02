module multiplexer4to1(sel,I0,I1,I2,I3,out);
input [1:0]sel;
input [31:0]I0;
input [31:0]I1;
input [31:0]I2;
input [31:0]I3;
output reg [31:0]out;
always@(I0 or I1 or I2 or I3 or sel)begin
    case (sel)
    2'b00 : out=I0;
    2'b01 : out=I1;
    2'b10 : out=I2;
    2'b11 : out=I3;
    default: out =0;
    endcase
end
endmodule 