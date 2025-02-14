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
// CREATED		"Mon Feb 10 22:16:37 2025"

module ProcessadorPipeline_SemMEM2(
	clk_ROM,
	clk,
	rst,
	RegWrite,
	BranchTaken,
	BranchTarget,
	writeData,
	writeReg,
	EX_MEM_MemWriteOut,
	EX_MEM_MemtoRegOut,
	EX_MEM_RegWrite,
	EX_MEM_MemReadOut,
	EX_MEM_Branch,
	EX_MEM_ALUResult,
	EX_MEM_BranchTarget,
	EX_MEM_WriteData,
	EX_MEM_WriteReg
);


input wire	clk_ROM;
input wire	clk;
input wire	rst;
input wire	RegWrite;
input wire	BranchTaken;
input wire	[7:0] BranchTarget;
input wire	[31:0] writeData;
input wire	[4:0] writeReg;
output wire	EX_MEM_MemWriteOut;
output wire	EX_MEM_MemtoRegOut;
output wire	EX_MEM_RegWrite;
output wire	EX_MEM_MemReadOut;
output wire	EX_MEM_Branch;
output wire	[31:0] EX_MEM_ALUResult;
output wire	[7:0] EX_MEM_BranchTarget;
output wire	[31:0] EX_MEM_WriteData;
output wire	[4:0] EX_MEM_WriteReg;

wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	[4:0] SYNTHESIZED_WIRE_9;
wire	[7:0] SYNTHESIZED_WIRE_10;
wire	[4:0] SYNTHESIZED_WIRE_11;
wire	[4:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	[31:0] SYNTHESIZED_WIRE_14;
wire	[31:0] SYNTHESIZED_WIRE_15;





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
	.ID_EX_RegDst(SYNTHESIZED_WIRE_2),
	.ID_EX_ALUSrc(SYNTHESIZED_WIRE_3),
	.ID_EX_MemToReg(SYNTHESIZED_WIRE_4),
	.ID_EX_RegWrite(SYNTHESIZED_WIRE_5),
	.ID_EX_MemRead(SYNTHESIZED_WIRE_6),
	.ID_EX_MemWrite(SYNTHESIZED_WIRE_7),
	.ID_EX_Branch(SYNTHESIZED_WIRE_8),
	.ID_EX_ALUOp(SYNTHESIZED_WIRE_9),
	.ID_EX_PC(SYNTHESIZED_WIRE_10),
	.ID_EX_Rb(SYNTHESIZED_WIRE_11),
	.ID_EX_Rd(SYNTHESIZED_WIRE_12),
	.ID_EX_ReadData1(SYNTHESIZED_WIRE_13),
	.ID_EX_ReadData2(SYNTHESIZED_WIRE_14),
	.ID_EX_SignExtImm(SYNTHESIZED_WIRE_15));


EX_STAGE	b2v_inst3(
	.ID_EX_RegDst(SYNTHESIZED_WIRE_2),
	.ID_EX_ALUSrc(SYNTHESIZED_WIRE_3),
	.ID_EX_MemtoReg(SYNTHESIZED_WIRE_4),
	.ID_EX_RegWrite(SYNTHESIZED_WIRE_5),
	.ID_EX_MemRead(SYNTHESIZED_WIRE_6),
	.ID_EX_MemWrite(SYNTHESIZED_WIRE_7),
	.ID_EX_Branch(SYNTHESIZED_WIRE_8),
	.clk(clk),
	.rst(rst),
	.ID_EX_ALUOp(SYNTHESIZED_WIRE_9),
	.ID_EX_PC(SYNTHESIZED_WIRE_10),
	.ID_EX_Rb(SYNTHESIZED_WIRE_11),
	.ID_EX_Rd(SYNTHESIZED_WIRE_12),
	.ID_EX_ReadData1(SYNTHESIZED_WIRE_13),
	.ID_EX_ReadData2(SYNTHESIZED_WIRE_14),
	.ID_EX_SignExtImm(SYNTHESIZED_WIRE_15),
	.EX_MEM_MemWriteOut(EX_MEM_MemWriteOut),
	.EX_MEM_MemtoRegOut(EX_MEM_MemtoRegOut),
	.EX_MEM_RegWrite(EX_MEM_RegWrite),
	.EX_MEM_MemReadOut(EX_MEM_MemReadOut),
	.EX_MEM_Branch(EX_MEM_Branch),
	.EX_MEM_ALUResult(EX_MEM_ALUResult),
	.EX_MEM_BranchTarget(EX_MEM_BranchTarget),
	.EX_MEM_WriteData(EX_MEM_WriteData),
	.EX_MEM_WriteReg(EX_MEM_WriteReg));


endmodule
