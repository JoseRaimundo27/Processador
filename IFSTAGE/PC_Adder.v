module PC_Adder (
    input wire [31:0] inPC,       // Valor atual do PC
    output wire [31:0] outPC      // PC incrementado (próxima instrução)
);

    // Soma 4 ao valor atual do PC
    assign outPC = inPC + 32'd4;

endmodule