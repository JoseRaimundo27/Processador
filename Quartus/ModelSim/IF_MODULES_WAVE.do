onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group CLK /TB_LW/dut_IF_STAGE/b2v_inst1/clk
add wave -noupdate -expand -group CLK /TB_LW/dut_IF_STAGE/b2v_inst1/rst
add wave -noupdate -expand -group ProgramCounter /TB_LW/dut_IF_STAGE/b2v_inst1/nextPC
add wave -noupdate -expand -group ProgramCounter /TB_LW/dut_IF_STAGE/b2v_inst1/currentPC
add wave -noupdate -expand -group MUX2TO1 /TB_LW/dut_IF_STAGE/b2v_inst4/in0
add wave -noupdate -expand -group MUX2TO1 /TB_LW/dut_IF_STAGE/b2v_inst4/in1
add wave -noupdate -expand -group MUX2TO1 /TB_LW/dut_IF_STAGE/b2v_inst4/sel
add wave -noupdate -expand -group MUX2TO1 /TB_LW/dut_IF_STAGE/b2v_inst4/out
add wave -noupdate -expand -group {PC ADDER} /TB_LW/dut_IF_STAGE/b2v_inst2/inPC
add wave -noupdate -expand -group {PC ADDER} /TB_LW/dut_IF_STAGE/b2v_inst2/outPC
add wave -noupdate -expand -group IF_ID_REGISTER /TB_LW/dut_IF_STAGE/b2v_inst/inPC
add wave -noupdate -expand -group IF_ID_REGISTER /TB_LW/dut_IF_STAGE/b2v_inst/inInstruction
add wave -noupdate -expand -group IF_ID_REGISTER /TB_LW/dut_IF_STAGE/b2v_inst/outPC
add wave -noupdate -expand -group IF_ID_REGISTER /TB_LW/dut_IF_STAGE/b2v_inst/outInstruction
add wave -noupdate -expand -group ROM /TB_LW/dut_IF_STAGE/b2v_inst3/address
add wave -noupdate -expand -group ROM /TB_LW/dut_IF_STAGE/b2v_inst3/clock
add wave -noupdate -expand -group ROM /TB_LW/dut_IF_STAGE/b2v_inst3/q
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {7 ps} 0}
quietly wave cursor active 1
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
WaveRestoreZoom {5 ps} {17 ps}
