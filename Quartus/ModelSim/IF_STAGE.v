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
// CREATED		"Sun Feb 09 11:30:56 2025"

module IF_STAGE(
	clk,
	rst,
	clk_ROM,
	BranchTaken,
	BranchTarget,
	IF_ID_Instruction,
	IF_ID_PC
);


input wire	clk;
input wire	rst;
input wire	clk_ROM;
input wire	BranchTaken;
input wire	[7:0] BranchTarget;
output wire	[31:0] IF_ID_Instruction;
output wire	[7:0] IF_ID_PC;

wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[7:0] SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_2;
wire	[7:0] SYNTHESIZED_WIRE_7;





IF_ID_Register	b2v_inst(
	.clk(clk),
	.rst(rst),
	.inInstruction(SYNTHESIZED_WIRE_0),
	.inPC(SYNTHESIZED_WIRE_6),
	.outInstruction(IF_ID_Instruction),
	.outPC(IF_ID_PC));


ProgramCounter	b2v_inst1(
	.clk(clk),
	.rst(rst),
	.nextPC(SYNTHESIZED_WIRE_2),
	.currentPC(SYNTHESIZED_WIRE_7));


PCAdder	b2v_inst2(
	.inPC(SYNTHESIZED_WIRE_7),
	.outPC(SYNTHESIZED_WIRE_6));


ROM	b2v_inst3(
	.clock(clk_ROM),
	.address(SYNTHESIZED_WIRE_7),
	.q(SYNTHESIZED_WIRE_0));


Mux2to1	b2v_inst4(
	.sel(BranchTaken),
	.in0(SYNTHESIZED_WIRE_6),
	.in1(BranchTarget),
	.out(SYNTHESIZED_WIRE_2));


endmodule
