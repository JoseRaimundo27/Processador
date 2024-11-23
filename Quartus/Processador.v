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
// CREATED		"Sat Nov 23 18:27:41 2024"

module Processador(
	clk,
	reset,
	data_in,
	instr_in,
	wren,
	clk_ram,
	clk_rom,
	addr_ram,
	addr_rom,
	data_out
);


input wire	clk;
input wire	reset;
input wire	[31:0] data_in;
input wire	[31:0] instr_in;
output wire	wren;
output wire	clk_ram;
output wire	clk_rom;
output wire	[7:0] addr_ram;
output wire	[7:0] addr_rom;
output wire	[31:0] data_out;

wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[7:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	[7:0] SYNTHESIZED_WIRE_7;

assign	wren = SYNTHESIZED_WIRE_2;
assign	clk_ram = SYNTHESIZED_WIRE_3;
assign	clk_rom = SYNTHESIZED_WIRE_6;
assign	addr_ram = SYNTHESIZED_WIRE_4;
assign	addr_rom = SYNTHESIZED_WIRE_7;
assign	data_out = SYNTHESIZED_WIRE_5;




CPU	b2v_inst(
	.clk(clk),
	.reset(reset),
	.data_in(SYNTHESIZED_WIRE_0),
	.instr_in(SYNTHESIZED_WIRE_1),
	.wren(SYNTHESIZED_WIRE_2),
	.clk_ram(SYNTHESIZED_WIRE_3),
	.clk_rom(SYNTHESIZED_WIRE_6),
	.addr_ram(SYNTHESIZED_WIRE_4),
	.addr_rom(SYNTHESIZED_WIRE_7),
	.data_out(SYNTHESIZED_WIRE_5));


RAM_INSTRUCTION	b2v_inst1(
	.wren(SYNTHESIZED_WIRE_2),
	.clock(SYNTHESIZED_WIRE_3),
	.address(SYNTHESIZED_WIRE_4),
	.data(SYNTHESIZED_WIRE_5),
	.q(SYNTHESIZED_WIRE_1));


ROM_DATA	b2v_inst2(
	.clock(SYNTHESIZED_WIRE_6),
	.address(SYNTHESIZED_WIRE_7),
	.q(SYNTHESIZED_WIRE_0));


endmodule
