module ram_instruction (
    input wire clk,                  // Clock
    input wire [7:0] addr,           // Endereço (8 bits para 256 palavras)
    input wire [31:0] data_in,       // Dados para escrita
    input wire write_enable,         // Sinal de controle: 1 para escrita, 0 para leitura
    output reg [31:0] data_out       // Dados lidos da memória
);

    // Memória interna
    reg [31:0] memory [0:255];       // 256 palavras de 32 bits

    // Operação da memória
    always @(posedge clk) begin
        if (write_enable) begin
            memory[addr] <= data_in; // Escrita na memória
        end else begin
            data_out <= memory[addr]; // Leitura da memória
        end
    end

endmodule
