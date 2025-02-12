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
// CREATED		"Tue Feb 11 20:49:07 2025"

module ProcessadorPipeline_MEM(
	EX_MEM_MemWrite,
	EX_MEM_MemToReg,
	EX_MEM_RegWrite,
	EX_MEM_MemRead,
	clk,
	rst,
	EX_MEM_ALUResult,
	EX_MEM_Data,
	EX_MEM_WriteReg,
	MEM_WB_MemToReg,
	MEM_WB_RegWrite,
	MEM_WB_ALUResult,
	MEM_WB_ReadData,
	MEM_WB_WriteReg
);


input wire	EX_MEM_MemWrite;
input wire	EX_MEM_MemToReg;
input wire	EX_MEM_RegWrite;
input wire	EX_MEM_MemRead;
input wire	clk;
input wire	rst;
input wire	[31:0] EX_MEM_ALUResult;
input wire	[31:0] EX_MEM_Data;
input wire	[4:0] EX_MEM_WriteReg;
output wire	MEM_WB_MemToReg;
output wire	MEM_WB_RegWrite;
output wire	[31:0] MEM_WB_ALUResult;
output wire	[31:0] MEM_WB_ReadData;
output wire	[4:0] MEM_WB_WriteReg;






MEM_STAGE	b2v_inst4(
	.EX_MEM_MemWrite(EX_MEM_MemWrite),
	.EX_MEM_MemToReg(EX_MEM_MemToReg),
	.EX_MEM_RegWrite(EX_MEM_RegWrite),
	.EX_MEM_MemRead(EX_MEM_MemRead),
	.clk(clk),
	.rst(rst),
	.EX_MEM_ALUResult(EX_MEM_ALUResult),
	.EX_MEM_Data(EX_MEM_Data),
	.EX_MEM_WriteReg(EX_MEM_WriteReg),
	.MEM_WB_MemToReg(MEM_WB_MemToReg),
	.MEM_WB_RegWrite(MEM_WB_RegWrite),
	.MEM_WB_ALUResult(MEM_WB_ALUResult),
	.MEM_WB_ReadData(MEM_WB_ReadData),
	.MEM_WB_WriteReg(MEM_WB_WriteReg));


endmodule
