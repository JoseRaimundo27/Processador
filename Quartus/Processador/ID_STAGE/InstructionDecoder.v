module InstructionDecoder (
    input wire [31:0] IF_ID_Instruction,  // Instrução completa
    output wire [4:0] opcode,            // OPCODE (bits 31:27)
    output wire [4:0] rb,                // Registrador base (RB) (bits 26:22)
    output wire [4:0] rd,                // Registrador destino (RD) (bits 21:17)
    output wire [15:0] immediate         // Valor imediato (IM) (bits 15:0)
);

    // Extração dos campos da instrução
    assign opcode = IF_ID_Instruction[31:27];
    assign rb = IF_ID_Instruction[26:22];
    assign rd = IF_ID_Instruction[21:17];
    assign immediate = IF_ID_Instruction[15:0];

endmodule
