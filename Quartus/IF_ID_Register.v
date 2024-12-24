module IF_ID_Register (
    input wire clk,                   // Clock
    input wire rst,                   // Sinal de reset
    input wire writeEnable,           // Sinal de controle: habilita escrita no registrador
    input wire [31:0] inPC,           // Entrada: PC incrementado
    input wire [31:0] inInstruction,  // Entrada: Instrução buscada da memória
    output reg [31:0] outPC,          // Saída: PC armazenado
    output reg [31:0] outInstruction  // Saída: Instrução armazenada
);

    // Sempre que o clock tiver uma borda de subida ou reset
    always @(posedge clk) begin
        if (rst) begin
            // Reset assíncrono: limpa os valores
            outPC <= 32'b0;
            outInstruction <= 32'b0;
        end else if (writeEnable) begin
            // Se writeEnable for 1, armazena os valores das entradas
            outPC <= inPC;
            outInstruction <= inInstruction;
        end
        // Caso writeEnable seja 0, mantém os valores atuais
    end

endmodule