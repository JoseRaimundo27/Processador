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
// CREATED		"Mon Feb 10 20:09:02 2025"

module ProcessadorPipeline_SemID(
	clk_ROM,
	clk,
	rst,
	BranchTaken,
	BranchTarget,
	IF_ID_Instruction,
	IF_ID_PC
);


input wire	clk_ROM;
input wire	clk;
input wire	rst;
input wire	BranchTaken;
input wire	[7:0] BranchTarget;
output wire	[31:0] IF_ID_Instruction;
output wire	[7:0] IF_ID_PC;






IF_STAGE	b2v_inst(
	.BranchTaken(BranchTaken),
	.clk_ROM(clk_ROM),
	.clk(clk),
	.rst(rst),
	.BranchTarget(BranchTarget),
	.IF_ID_Instruction(IF_ID_Instruction),
	.IF_ID_PC(IF_ID_PC));


endmodule
