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
// CREATED		"Sun Feb 09 15:25:42 2025"

module EX_STAGE(
	ID_EX_ALUSrc,
	rst,
	clk,
	ID_EX_RegWrite,
	ID_EX_MemtoReg,
	ID_EX_MemWrite,
	ID_EX_MemRead,
	ID_EX_Branch,
	ID_EX_RegDst,
	ID_EX_ALUOp,
	ID_EX_PC,
	ID_EX_Rb,
	ID_EX_Rd,
	ID_EX_ReadData1,
	ID_EX_ReadData2,
	ID_EX_SignExtImm,
	EX_MEM_MemtoRegOut,
	EX_MEM_MemWriteOut,
	EX_MEM_MemReadOut,
	EX_MEM_Branch,
	EX_MEM_RegWrite,
	EX_MEM_ALUResult,
	EX_MEM_BranchTarget,
	EX_MEM_WriteData,
	EX_MEM_WriteReg
);


input wire	ID_EX_ALUSrc;
input wire	rst;
input wire	clk;
input wire	ID_EX_RegWrite;
input wire	ID_EX_MemtoReg;
input wire	ID_EX_MemWrite;
input wire	ID_EX_MemRead;
input wire	ID_EX_Branch;
input wire	ID_EX_RegDst;
input wire	[4:0] ID_EX_ALUOp;
input wire	[7:0] ID_EX_PC;
input wire	[4:0] ID_EX_Rb;
input wire	[4:0] ID_EX_Rd;
input wire	[31:0] ID_EX_ReadData1;
input wire	[31:0] ID_EX_ReadData2;
input wire	[31:0] ID_EX_SignExtImm;
output wire	EX_MEM_MemtoRegOut;
output wire	EX_MEM_MemWriteOut;
output wire	EX_MEM_MemReadOut;
output wire	EX_MEM_Branch;
output wire	EX_MEM_RegWrite;
output wire	[31:0] EX_MEM_ALUResult;
output wire	[7:0] EX_MEM_BranchTarget;
output wire	[31:0] EX_MEM_WriteData;
output wire	[4:0] EX_MEM_WriteReg;

wire	[31:0] SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	[31:0] SYNTHESIZED_WIRE_2;
wire	[31:0] SYNTHESIZED_WIRE_3;
wire	[4:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;





ALU32Bits	b2v_inst(
	.ALUControl(ID_EX_ALUOp),
	.data1(ID_EX_ReadData1),
	.data2(SYNTHESIZED_WIRE_0),
	.zero(SYNTHESIZED_WIRE_5),
	.ALUResult(SYNTHESIZED_WIRE_2));
	defparam	b2v_inst.ADD = 5'b00110;
	defparam	b2v_inst.AND = 5'b01010;
	defparam	b2v_inst.BRFL = 5'b10010;
	defparam	b2v_inst.CALL = 5'b10011;
	defparam	b2v_inst.CMP = 5'b01110;
	defparam	b2v_inst.DIV = 5'b01001;
	defparam	b2v_inst.JPC = 5'b10001;
	defparam	b2v_inst.JR = 5'b10000;
	defparam	b2v_inst.LW_1 = 5'b00000;
	defparam	b2v_inst.LW_2 = 5'b00001;
	defparam	b2v_inst.LW_3 = 5'b00010;
	defparam	b2v_inst.MOV = 5'b00101;
	defparam	b2v_inst.MUL = 5'b01000;
	defparam	b2v_inst.NOP = 5'b10101;
	defparam	b2v_inst.NOT = 5'b01111;
	defparam	b2v_inst.OR = 5'b01011;
	defparam	b2v_inst.RET = 5'b10100;
	defparam	b2v_inst.SHL = 5'b01100;
	defparam	b2v_inst.SHR = 5'b01101;
	defparam	b2v_inst.SUB = 5'b00111;
	defparam	b2v_inst.SW_1 = 5'b00011;
	defparam	b2v_inst.SW_2 = 5'b00100;


Somador	b2v_inst11(
	.entrada1(ID_EX_PC),
	.entrada2(ID_EX_SignExtImm),
	.saida(SYNTHESIZED_WIRE_3));


EX_MEM_REGISTER	b2v_inst12(
	.clk(clk),
	.reset(rst),
	.RegWrite(ID_EX_RegWrite),
	.MemtoReg(ID_EX_MemtoReg),
	.MemWrite(ID_EX_MemWrite),
	.MemRead(ID_EX_MemRead),
	.inBranchTaken(SYNTHESIZED_WIRE_1),
	.ALUresult(SYNTHESIZED_WIRE_2),
	.inBranchTarget(SYNTHESIZED_WIRE_3),
	.writedata(ID_EX_SignExtImm),
	.writeReg(SYNTHESIZED_WIRE_4),
	.MemWriteOut(EX_MEM_MemWriteOut),
	.MemtoRegOut(EX_MEM_MemtoRegOut),
	.RegWriteOut(EX_MEM_RegWrite),
	.MemReadOut(EX_MEM_MemReadOut),
	.outBranchTaken(EX_MEM_Branch),
	.outALUResult(EX_MEM_ALUResult),
	.outBranchTarget(EX_MEM_BranchTarget),
	.writedataOut(EX_MEM_WriteData),
	.writeRegOut(EX_MEM_WriteReg));


Mux2to1_5bits	b2v_inst13(
	.select(ID_EX_RegDst),
	.in0(ID_EX_Rb),
	.in1(ID_EX_Rd),
	.out(SYNTHESIZED_WIRE_4));

assign	SYNTHESIZED_WIRE_1 = ID_EX_Branch & SYNTHESIZED_WIRE_5;


Mux2to1_32bits	b2v_inst8(
	.select(ID_EX_ALUSrc),
	.in0(ID_EX_ReadData2),
	.in1(ID_EX_SignExtImm),
	.out(SYNTHESIZED_WIRE_0));


endmodule
