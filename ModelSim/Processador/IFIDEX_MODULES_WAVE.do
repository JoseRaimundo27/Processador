onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TB_LW/dut_IF_STAGE/clk
add wave -noupdate /TB_LW/dut_IF_STAGE/rst
add wave -noupdate /TB_LW/dut_IF_STAGE/clk_ROM
add wave -noupdate /TB_LW/dut_IF_STAGE/BranchTaken
add wave -noupdate /TB_LW/dut_IF_STAGE/BranchTarget
add wave -noupdate /TB_LW/dut_IF_STAGE/IF_ID_Instruction
add wave -noupdate /TB_LW/dut_IF_STAGE/IF_ID_PC
add wave -noupdate /TB_LW/dut_ID_STAGE/RegWrite
add wave -noupdate /TB_LW/dut_ID_STAGE/IF_ID_Instruction
add wave -noupdate /TB_LW/dut_ID_STAGE/IF_ID_PC
add wave -noupdate /TB_LW/dut_ID_STAGE/writeData
add wave -noupdate /TB_LW/dut_ID_STAGE/writeReg
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_RegDst
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_ALUSrc
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_MemToReg
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_RegWrite
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_MemRead
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_MemWrite
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_Branch
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_ALUOp
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_PC
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_Rb
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_Rd
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_ReadData1
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_ReadData2
add wave -noupdate /TB_LW/dut_ID_STAGE/ID_EX_SignExtImm
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_ALUSrc
add wave -noupdate /TB_LW/dut_EX_STAGE/rst
add wave -noupdate /TB_LW/dut_EX_STAGE/clk
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_RegWrite
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_MemtoReg
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_MemWrite
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_MemRead
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_Branch
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_RegDst
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_ALUOp
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_PC
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_Rb
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_Rd
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_ReadData1
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_ReadData2
add wave -noupdate /TB_LW/dut_EX_STAGE/ID_EX_SignExtImm
add wave -noupdate /TB_LW/dut_EX_STAGE/EX_MEM_MemtoRegOut
add wave -noupdate /TB_LW/dut_EX_STAGE/EX_MEM_MemWriteOut
add wave -noupdate /TB_LW/dut_EX_STAGE/EX_MEM_MemReadOut
add wave -noupdate /TB_LW/dut_EX_STAGE/EX_MEM_Branch
add wave -noupdate /TB_LW/dut_EX_STAGE/EX_MEM_RegWrite
add wave -noupdate /TB_LW/dut_EX_STAGE/EX_MEM_ALUResult
add wave -noupdate /TB_LW/dut_EX_STAGE/EX_MEM_BranchTarget
add wave -noupdate /TB_LW/dut_EX_STAGE/EX_MEM_WriteData
add wave -noupdate /TB_LW/dut_EX_STAGE/EX_MEM_WriteReg
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ps} 0}
quietly wave cursor active 0
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1 ns}
