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
// CREATED		"Tue Feb 11 21:47:48 2025"

module Mem_Stage(
	clk,
	EX_MEM_MemWrite,
	rst,
	EX_MEM_MemToReg,
	EX_MEM_RegWrite,
	EX_MEM_MemRead,
	clk_RAM,
	EX_MEM_ALUResult,
	EX_MEM_Data,
	EX_MEM_WriteReg,
	MEM_WB_MemToReg,
	MEM_WB_RegWrite,
	MEM_WB_ALUResult,
	MEM_WB_ReadData,
	MEM_WB_WriteReg
);


input wire	clk;
input wire	EX_MEM_MemWrite;
input wire	rst;
input wire	EX_MEM_MemToReg;
input wire	EX_MEM_RegWrite;
input wire	EX_MEM_MemRead;
input wire	clk_RAM;
input wire	[31:0] EX_MEM_ALUResult;
input wire	[31:0] EX_MEM_Data;
input wire	[4:0] EX_MEM_WriteReg;
output wire	MEM_WB_MemToReg;
output wire	MEM_WB_RegWrite;
output wire	[31:0] MEM_WB_ALUResult;
output wire	[31:0] MEM_WB_ReadData;
output wire	[4:0] MEM_WB_WriteReg;

wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_1;





MEM_WB_Register	b2v_inst(
	.clk(clk),
	.rst(rst),
	.inMemToReg(EX_MEM_MemToReg),
	.inRegWrite(EX_MEM_RegWrite),
	.inALUResult(EX_MEM_ALUResult),
	.inReadData(SYNTHESIZED_WIRE_0),
	.inWriteReg(EX_MEM_WriteReg),
	.outMemToReg(MEM_WB_MemToReg),
	.outRegWrite(MEM_WB_RegWrite),
	.outALUResult(MEM_WB_ALUResult),
	.outReadData(MEM_WB_ReadData),
	.outWriteReg(MEM_WB_WriteReg));


RAM	b2v_inst1(
	.wren(EX_MEM_MemWrite),
	.rden(EX_MEM_MemRead),
	.clock(clk_RAM),
	.address(SYNTHESIZED_WIRE_1),
	.data(EX_MEM_Data),
	.q(SYNTHESIZED_WIRE_0));


ExtractMSB	b2v_inst2(
	.data_in(EX_MEM_ALUResult),
	.data_out(SYNTHESIZED_WIRE_1));


endmodule
