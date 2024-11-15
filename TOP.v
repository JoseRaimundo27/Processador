module TOP (
    input wire clk,
    input wire reset,
    output wire [31:0] addr_bus,  // Barramento de endereços
    output wire [31:0] data_out, // Dados enviados pela CPU
    input wire [31:0] data_in,   // Dados recebidos pela CPU
    output wire mem_write        // Sinal de escrita na memória
);

    // Barramentos internos
    wire [31:0] instruction;     // Instrução atual (RAM -> CPU)
    wire [31:0] data;            // Dados transferidos (ROM -> CPU)
    wire [31:0] cpu_address;     // Endereço gerado pela CPU

    // Instância da CPU
    CPU cpu (
        .clk(clk),
        .reset(reset),
        .instruction(instruction),
        .data_in(data),
        .data_out(data_out),
        .addr(cpu_address),
        .mem_write(mem_write)
    );

    // Instância da RAM (instruções)
    ram_instruction ram_inst (
        .clk(clk),
        .addr(cpu_address[7:0]), // Usando apenas 8 bits do endereço
        .data_in(data_out),      // Dados enviados pela CPU
        .write_enable(mem_write), // Controle de escrita
        .data_out(instruction)   // Instrução lida pela CPU
    );

    // Instância da ROM (dados)
   rom_data rom (
    .clk(clk),               // Clock
    .addr(cpu_address[7:0]), // Endereço
    .data_out(data)          // Dados lidos
);

    // Conectando barramentos externos
    assign addr_bus = cpu_address;

endmodule
