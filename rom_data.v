module rom_data (
    input wire clk,                 // Clock
    input wire [7:0] addr,          // Endereço (8 bits para 256 palavras)
    output reg [31:0] data_out      // Dados lidos da ROM
);

    // Memória interna
    reg [31:0] memory [0:255];      // 256 palavras de 32 bits

    // Inicialização da ROM
    initial begin
        memory[0] = 32'hAABBCCDD;
        memory[1] = 32'hEEFF0011;
        memory[2] = 32'h33333333;
        memory[3] = 32'h44444444;
        // Outros valores podem ser inicializados aqui
    end

    // Leitura síncrona
    always @(posedge clk) begin
        data_out <= memory[addr];   // Dados disponibilizados na borda do clock
    end

endmodule
