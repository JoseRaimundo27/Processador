module Mux_ALUScr(
    input [31:0] ReadData2,
    input [31:0] SignExtend,
    input ALUScr,
    output reg [31:0] ALUInput 
);

always @(*) begin
    if (ALUScr == 1'b1)
        ALUInput = SignExtend;
    else
        ALUInput = ReadData2;
end
endmodule
