module CPU (
    input wire clk,
    input wire reset,
    input wire [31:0] instruction,  // Instrução recebida
    input wire [31:0] data_in,      // Dados de entrada
    output wire [31:0] data_out,    // Dados de saída
    output wire [31:0] addr,        // Endereço gerado pela CPU
    output wire mem_write           // Sinal de escrita na memória
);
    // CPU básica para compilar
    assign data_out = 32'h00000000; // Dados de saída fixos
    assign addr = 32'h00000000;     // Endereço fixo
    assign mem_write = 1'b0;        // Não escreve na memória
endmodule
