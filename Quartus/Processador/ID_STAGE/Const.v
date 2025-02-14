`ifndef CONST_V
`define CONST_V

// Definição de opcodes (instruções)
localparam LW_1  = 5'b00000;  // Load Word - Estado 1
localparam LW_2  = 5'b00001;  // Load Word - Estado 2
localparam LW_3  = 5'b00010;  // Load Word - Estado 3
localparam SW_1  = 5'b00011;  // Store Word - Estado 1
localparam SW_2  = 5'b00100;  // Store Word - Estado 2
localparam MOV   = 5'b00101;  // Move
localparam ADD   = 5'b00110;  // Add
localparam SUB   = 5'b00111;  // Subtract
localparam MUL   = 5'b01000;  // Multiply
localparam DIV   = 5'b01001;  // Divide
localparam AND   = 5'b01010;  // AND
localparam OR    = 5'b01011;  // OR
localparam SHL   = 5'b01100;  // Shift Left
localparam SHR   = 5'b01101;  // Shift Right
localparam CMP   = 5'b01110;  // Compare
localparam NOT   = 5'b01111;  // NOT
localparam JR    = 5'b10000;  // Jump Register
localparam JPC   = 5'b10001;  // Jump on Condition
localparam BRFL  = 5'b10010;  // Branch Flag
localparam CALL  = 5'b10011;  // Call
localparam RET   = 5'b10100;  // Return
localparam NOP   = 5'b10101;  // No Operation

`endif