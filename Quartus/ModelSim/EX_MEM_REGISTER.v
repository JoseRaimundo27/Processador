module EX_MEM_REGISTER (
    input wire clk, reset,
    input wire RegWrite, MemtoReg,
    input wire MemWrite, MemRead,
    input wire [31:0] ALUresult, writedata,
    input wire [4:0] writeReg,
	 input wire inBranchTaken,
	 input wire [31:0] inBranchTarget,
	 output reg [31:0] outALUResult,
	 output reg [31:0] writedataOut,
	 output reg MemWriteOut,
	 output reg [4:0]writeRegOut,
    output reg MemtoRegOut,  
    output reg RegWriteOut,
    output reg MemReadOut,
	 output reg outBranchTaken,
	 output reg [7:0] outBranchTarget
    );
  
always@(posedge clk)
if (reset) begin
    RegWriteOut <= 1'b0;
    MemtoRegOut <= 1'b0;
    MemWriteOut <= 1'b0;
    MemReadOut <= 1'b0;
    writedataOut <= 32'b0;
    writeRegOut <= 4'b0;
	 outALUResult <= 32'b0;
	 outBranchTaken <= 1'b0;
	 outBranchTarget <= 8'b0;
end
else begin
    RegWriteOut <= RegWrite;
    MemtoRegOut <= MemtoReg;
    MemWriteOut <= MemWrite;
    MemReadOut <= MemRead;
    writedataOut <= writedata;
    writeRegOut <= writeReg;
	 outALUResult <= ALUresult;
	 outBranchTaken <= inBranchTaken;
	 outBranchTarget <= inBranchTarget[7:0];
end
endmodule
