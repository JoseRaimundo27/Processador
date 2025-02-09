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
// CREATED		"Sun Feb 09 13:15:53 2025"

module ID_STAGE(
	RegWrite,
	clk,
	rst,
	IF_ID_Instruction1,
	IF_ID_PC4,
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


input wire	RegWrite;
input wire	clk;
input wire	rst;
input wire	[31:0] IF_ID_Instruction1;
input wire	[7:0] IF_ID_PC4;
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

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[4:0] SYNTHESIZED_WIRE_7;
wire	[4:0] SYNTHESIZED_WIRE_17;
wire	[4:0] SYNTHESIZED_WIRE_18;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[31:0] SYNTHESIZED_WIRE_11;
wire	[31:0] SYNTHESIZED_WIRE_12;
wire	[15:0] SYNTHESIZED_WIRE_13;
wire	[4:0] SYNTHESIZED_WIRE_16;





ID_EX_Register	b2v_inst5(
	.clk(clk),
	.rst(rst),
	.inRegDst(SYNTHESIZED_WIRE_0),
	.inALUSrc(SYNTHESIZED_WIRE_1),
	.inMemToReg(SYNTHESIZED_WIRE_2),
	.inRegWrite(SYNTHESIZED_WIRE_3),
	.inMemRead(SYNTHESIZED_WIRE_4),
	.inMemWrite(SYNTHESIZED_WIRE_5),
	.inBranch(SYNTHESIZED_WIRE_6),
	.inALUOp(SYNTHESIZED_WIRE_7),
	.inPc(IF_ID_PC4),
	.inRb(SYNTHESIZED_WIRE_17),
	.inRd(SYNTHESIZED_WIRE_18),
	.inReadData1(SYNTHESIZED_WIRE_10),
	.inReadData2(SYNTHESIZED_WIRE_11),
	.inSignExtImm(SYNTHESIZED_WIRE_12),
	.outRegDst(ID_EX_RegDst),
	.outALUSrc(ID_EX_ALUSrc),
	.outMemToReg(ID_EX_MemToReg),
	.outRegWrite(ID_EX_RegWrite),
	.outMemRead(ID_EX_MemRead),
	.outMemWrite(ID_EX_MemWrite),
	.outBranch(ID_EX_Branch),
	.outALUOp(ID_EX_ALUOp),
	.outPc(ID_EX_PC),
	.outRb(ID_EX_Rb),
	.outRd(ID_EX_Rd),
	.outReadData1(ID_EX_ReadData1),
	.outReadData2(ID_EX_ReadData2),
	.outSignExtImm(ID_EX_SignExtImm));


SignExtend	b2v_inst6(
	.immediate(SYNTHESIZED_WIRE_13),
	.signExtImm(SYNTHESIZED_WIRE_12));


RegisterFile	b2v_inst7(
	.clk(clk),
	.rst(rst),
	.RegWrite(RegWrite),
	.readReg1(SYNTHESIZED_WIRE_17),
	.readReg2(SYNTHESIZED_WIRE_18),
	.writeData(writeData),
	.writeReg(writeReg),
	.readData1(SYNTHESIZED_WIRE_10),
	.readData2(SYNTHESIZED_WIRE_11));


Control	b2v_inst8(
	.clk(clk),
	.opcode(SYNTHESIZED_WIRE_16),
	.RegDst(SYNTHESIZED_WIRE_0),
	.ALUSrc(SYNTHESIZED_WIRE_1),
	.MemToReg(SYNTHESIZED_WIRE_2),
	.RegWrite(SYNTHESIZED_WIRE_3),
	.MemRead(SYNTHESIZED_WIRE_4),
	.MemWrite(SYNTHESIZED_WIRE_5),
	.Branch(SYNTHESIZED_WIRE_6),
	.ALUOp(SYNTHESIZED_WIRE_7));
	defparam	b2v_inst8.ADD = 5'b00110;
	defparam	b2v_inst8.AND = 5'b01010;
	defparam	b2v_inst8.BRFL = 5'b10010;
	defparam	b2v_inst8.CALL = 5'b10011;
	defparam	b2v_inst8.CMP = 5'b01110;
	defparam	b2v_inst8.DIV = 5'b01001;
	defparam	b2v_inst8.JPC = 5'b10001;
	defparam	b2v_inst8.JR = 5'b10000;
	defparam	b2v_inst8.LW_1 = 5'b00000;
	defparam	b2v_inst8.LW_2 = 5'b00001;
	defparam	b2v_inst8.LW_3 = 5'b00010;
	defparam	b2v_inst8.MOV = 5'b00101;
	defparam	b2v_inst8.MUL = 5'b01000;
	defparam	b2v_inst8.NOP = 5'b10101;
	defparam	b2v_inst8.NOT = 5'b01111;
	defparam	b2v_inst8.OR = 5'b01011;
	defparam	b2v_inst8.RET = 5'b10100;
	defparam	b2v_inst8.SHL = 5'b01100;
	defparam	b2v_inst8.SHR = 5'b01101;
	defparam	b2v_inst8.SUB = 5'b00111;
	defparam	b2v_inst8.SW_1 = 5'b00011;
	defparam	b2v_inst8.SW_2 = 5'b00100;


InstructionDecoder	b2v_inst9(
	.IF_ID_Instruction(IF_ID_Instruction1),
	.immediate(SYNTHESIZED_WIRE_13),
	.opcode(SYNTHESIZED_WIRE_16),
	.rb(SYNTHESIZED_WIRE_17),
	.rd(SYNTHESIZED_WIRE_18));


endmodule
