// Copyright (C) 2018  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 18.1.0 Build 625 09/12/2018 SJ Lite Edition"
// CREATED		"Mon Feb 10 20:06:20 2025"

module ProcessadorPipeline_SemEX(
	clk_ROM,
	clk,
	rst,
	RegWrite,
	BranchTaken,
	BranchTarget,
	writeData,
	writeReg,
	ID_EX_RegDst,
	ID_EX_ALUSrc,
	ID_EX_MemToReg,
	ID_EX_RegWrite,
	ID_EX_MemRead,
	ID_EX_MemWrite,
	ID_EX_Branch,
	ID_EX_ALUOp,
	ID_EX_PC,
	ID_EX_Rb,
	ID_EX_Rd,
	ID_EX_ReadData1,
	ID_EX_ReadData2,
	ID_EX_SignExtImm
);


input wire	clk_ROM;
input wire	clk;
input wire	rst;
input wire	RegWrite;
input wire	BranchTaken;
input wire	[7:0] BranchTarget;
input wire	[31:0] writeData;
input wire	[4:0] writeReg;
output wire	ID_EX_RegDst;
output wire	ID_EX_ALUSrc;
output wire	ID_EX_MemToReg;
output wire	ID_EX_RegWrite;
output wire	ID_EX_MemRead;
output wire	ID_EX_MemWrite;
output wire	ID_EX_Branch;
output wire	[4:0] ID_EX_ALUOp;
output wire	[7:0] ID_EX_PC;
output wire	[4:0] ID_EX_Rb;
output wire	[4:0] ID_EX_Rd;
output wire	[31:0] ID_EX_ReadData1;
output wire	[31:0] ID_EX_ReadData2;
output wire	[31:0] ID_EX_SignExtImm;

wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;





IF_STAGE	b2v_inst(
	.BranchTaken(BranchTaken),
	.clk_ROM(clk_ROM),
	.clk(clk),
	.rst(rst),
	.BranchTarget(BranchTarget),
	.IF_ID_Instruction(SYNTHESIZED_WIRE_0),
	.IF_ID_PC(SYNTHESIZED_WIRE_1));


ID_STAGE	b2v_inst1(
	.RegWrite(RegWrite),
	.clk(clk),
	.rst(rst),
	.IF_ID_Instruction1(SYNTHESIZED_WIRE_0),
	.IF_ID_PC4(SYNTHESIZED_WIRE_1),
	.writeData(writeData),
	.writeReg(writeReg),
	.ID_EX_RegDst(ID_EX_RegDst),
	.ID_EX_ALUSrc(ID_EX_ALUSrc),
	.ID_EX_MemToReg(ID_EX_MemToReg),
	.ID_EX_RegWrite(ID_EX_RegWrite),
	.ID_EX_MemRead(ID_EX_MemRead),
	.ID_EX_MemWrite(ID_EX_MemWrite),
	.ID_EX_Branch(ID_EX_Branch),
	.ID_EX_ALUOp(ID_EX_ALUOp),
	.ID_EX_PC(ID_EX_PC),
	.ID_EX_Rb(ID_EX_Rb),
	.ID_EX_Rd(ID_EX_Rd),
	.ID_EX_ReadData1(ID_EX_ReadData1),
	.ID_EX_ReadData2(ID_EX_ReadData2),
	.ID_EX_SignExtImm(ID_EX_SignExtImm));


endmodule
