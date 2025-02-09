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
// CREATED		"Sun Feb 09 11:07:35 2025"

module Processador(
	clk,
	rst,
	clk_ROM
);


input wire	clk;
input wire	rst;
input wire	clk_ROM;

wire	SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	[4:0] SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_12;
wire	[4:0] SYNTHESIZED_WIRE_13;
wire	SYNTHESIZED_WIRE_14;
wire	SYNTHESIZED_WIRE_15;
wire	[31:0] SYNTHESIZED_WIRE_16;
wire	[31:0] SYNTHESIZED_WIRE_17;
wire	[4:0] SYNTHESIZED_WIRE_18;
wire	SYNTHESIZED_WIRE_19;
wire	SYNTHESIZED_WIRE_20;
wire	SYNTHESIZED_WIRE_21;
wire	SYNTHESIZED_WIRE_22;
wire	SYNTHESIZED_WIRE_23;
wire	SYNTHESIZED_WIRE_24;
wire	SYNTHESIZED_WIRE_25;
wire	[4:0] SYNTHESIZED_WIRE_26;
wire	[7:0] SYNTHESIZED_WIRE_27;
wire	[4:0] SYNTHESIZED_WIRE_28;
wire	[4:0] SYNTHESIZED_WIRE_29;
wire	[31:0] SYNTHESIZED_WIRE_30;
wire	[31:0] SYNTHESIZED_WIRE_31;
wire	[31:0] SYNTHESIZED_WIRE_32;





IF_STAGE	b2v_inst(
	.clk(clk),
	.rst(rst),
	.BranchTaken(SYNTHESIZED_WIRE_0),
	.clk_ROM(clk_ROM),
	.BranchTarget(SYNTHESIZED_WIRE_1),
	.IF_ID_Instruction(SYNTHESIZED_WIRE_3),
	.IF_ID_PC(SYNTHESIZED_WIRE_4));


ID_STAGE	b2v_inst2(
	.clk(clk),
	.rst(rst),
	.RegWrite(SYNTHESIZED_WIRE_2),
	.IF_ID_Instruction(SYNTHESIZED_WIRE_3),
	.IF_ID_PC(SYNTHESIZED_WIRE_4),
	.writeData(SYNTHESIZED_WIRE_5),
	.writeReg(SYNTHESIZED_WIRE_6),
	.ID_EX_RegDst(SYNTHESIZED_WIRE_19),
	.ID_EX_ALUSrc(SYNTHESIZED_WIRE_20),
	.ID_EX_MemToReg(SYNTHESIZED_WIRE_21),
	.ID_EX_RegWrite(SYNTHESIZED_WIRE_22),
	.ID_EX_MemRead(SYNTHESIZED_WIRE_23),
	.ID_EX_MemWrite(SYNTHESIZED_WIRE_24),
	.ID_EX_Branch(SYNTHESIZED_WIRE_25),
	.ID_EX_ALUOp(SYNTHESIZED_WIRE_26),
	.ID_EX_PC(SYNTHESIZED_WIRE_27),
	.ID_EX_Rb(SYNTHESIZED_WIRE_28),
	.ID_EX_Rd(SYNTHESIZED_WIRE_29),
	.ID_EX_ReadData1(SYNTHESIZED_WIRE_30),
	.ID_EX_ReadData2(SYNTHESIZED_WIRE_31),
	.ID_EX_SignExtImm(SYNTHESIZED_WIRE_32));


MEM_STAGE	b2v_inst3(
	.EX_MEM_MemWrite(SYNTHESIZED_WIRE_7),
	.EX_MEM_MemToReg(SYNTHESIZED_WIRE_8),
	.EX_MEM_RegWrite(SYNTHESIZED_WIRE_9),
	.EX_MEM_MemRead(SYNTHESIZED_WIRE_10),
	.rst(rst),
	.clk(clk),
	.EX_MEM_ALUResult(SYNTHESIZED_WIRE_11),
	.EX_MEM_Data(SYNTHESIZED_WIRE_12),
	.EX_MEM_WriteReg(SYNTHESIZED_WIRE_13),
	.MEM_WB_MemToReg(SYNTHESIZED_WIRE_15),
	.MEM_WB_RegWrite(SYNTHESIZED_WIRE_14),
	.MEM_WB_ALUResult(SYNTHESIZED_WIRE_16),
	.MEM_WB_ReadData(SYNTHESIZED_WIRE_17),
	.MEM_WB_WriteReg(SYNTHESIZED_WIRE_18));


WB_Stage	b2v_inst7(
	.clk(clk),
	.rst(rst),
	.RegWrite(SYNTHESIZED_WIRE_14),
	.MemToReg(SYNTHESIZED_WIRE_15),
	.ALUResult(SYNTHESIZED_WIRE_16),
	.MemData(SYNTHESIZED_WIRE_17),
	.WriteReg(SYNTHESIZED_WIRE_18),
	.RegWriteOut(SYNTHESIZED_WIRE_2),
	.WriteData(SYNTHESIZED_WIRE_5),
	.WriteRegOut(SYNTHESIZED_WIRE_6));


EX_STAGE	b2v_inst8(
	.ID_EX_RegDst(SYNTHESIZED_WIRE_19),
	.ID_EX_ALUSrc(SYNTHESIZED_WIRE_20),
	.ID_EX_MemtoReg(SYNTHESIZED_WIRE_21),
	.ID_EX_RegWrite(SYNTHESIZED_WIRE_22),
	.ID_EX_MemRead(SYNTHESIZED_WIRE_23),
	.ID_EX_MemWrite(SYNTHESIZED_WIRE_24),
	.ID_EX_Branch(SYNTHESIZED_WIRE_25),
	.clk(rst),
	.rst(clk),
	.ID_EX_ALUOp(SYNTHESIZED_WIRE_26),
	.ID_EX_PC(SYNTHESIZED_WIRE_27),
	.ID_EX_Rb(SYNTHESIZED_WIRE_28),
	.ID_EX_Rd(SYNTHESIZED_WIRE_29),
	.ID_EX_ReadData1(SYNTHESIZED_WIRE_30),
	.ID_EX_ReadData2(SYNTHESIZED_WIRE_31),
	.ID_EX_SignExtImm(SYNTHESIZED_WIRE_32),
	.EX_MEM_RegWriteOut(SYNTHESIZED_WIRE_9),
	.EX_MEM_MemtoRegOut(SYNTHESIZED_WIRE_8),
	.EX_MEM_MemWriteOut(SYNTHESIZED_WIRE_7),
	.EX_MEM_MemReadOut(SYNTHESIZED_WIRE_10),
	.EX_MEM_Branch(SYNTHESIZED_WIRE_0),
	.EX_MEM_ALUResult(SYNTHESIZED_WIRE_11),
	.EX_MEM_BranchTarget(SYNTHESIZED_WIRE_1),
	.EX_MEM_WriteData(SYNTHESIZED_WIRE_12),
	.EX_MEM_WriteReg(SYNTHESIZED_WIRE_13));


endmodule
