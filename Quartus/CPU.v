module CPU (
    input clk,                      // Clock principal
    input reset,                    // Reset
    input [31:0] instr_in,          // Entrada de instruções (da ROM)
    input [31:0] data_in,           // Entrada de dados (da RAM)
    output [7:0] addr_rom,          // Saída de endereço (8 bits) para a ROM
    output [7:0] addr_ram,          // Saída de endereço (8 bits) para a RAM
    output [31:0] data_out,         // Saída de dados para escrita na RAM
    output wren,                    // Sinal de escrita na RAM
    output clk_ram,                 // Clock para a RAM (controlado pela UC)
    output clk_rom                  // Clock para a ROM (controlado pela UC)
);
	/*
    // Sinais internos para interconexão
    wire [31:0] alu_result;         // Resultado da ULA
    wire zero_flag;                 // Flag zero da ULA
    wire [31:0] reg_a, reg_b;       // Saídas dos registradores
    wire [31:0] imm_value;          // Valor imediato decodificado
    wire [7:0] next_pc;             // Próximo valor do PC (8 bits)
    wire [3:0] alu_op;              // Operação da ULA
    wire [7:0] addr_control_ram;    // Endereço gerado pela UC para RAM (8 bits)
    wire [7:0] addr_control_rom;    // Endereço gerado pela UC para ROM (8 bits)
    wire wren_reg;                  // Sinal de escrita para os registradores (controlado pela UC)

    // Unidade de Controle (UC)
    UC uc (
        .clk(clk),
        .reset(reset),
        .instr_in(instr_in),        // Instrução recebida da ROM
        .zero_flag(zero_flag),      // Flag zero da ULA
        .alu_op(alu_op),            // Operação da ULA
        .imm_value(imm_value),      // Valor imediato
        .next_pc(next_pc),          // Próximo endereço do PC (8 bits)
        .addr_rom(addr_control_rom),// Endereço da ROM (8 bits)
        .addr_ram(addr_control_ram),// Endereço da RAM (8 bits)
        .wren(wren),                // Sinal de escrita na RAM
        .wren_reg(wren_reg),        // Sinal de escrita nos registradores
        .clk_ram(clk_ram),          // Clock controlado para RAM
        .clk_rom(clk_rom)           // Clock controlado para ROM
    );

    // Unidade Lógica e Aritmética (ULA)
    ULA ula (
        .a(reg_a),                  // Operando A
        .b(reg_b),                  // Operando B
        .op(alu_op),                // Operação (definida pela UC)
        .result(alu_result),        // Resultado da ULA
        .zero(zero_flag)            // Flag zero
    );

    // Banco de Registradores
    Registers registers (
        .clk(clk),
        .reset(reset),
        .reg_write(wren_reg),       // Sinal de escrita nos registradores
        .data_in(alu_result),       // Entrada de dados (resultado da ULA)
        .reg_a(reg_a),              // Saída A
        .reg_b(reg_b)               // Saída B
    );

    // Controlando os endereços de memória e dados
    assign addr_ram = addr_control_ram;  // Endereço RAM (8 bits) vindo da UC
    assign addr_rom = addr_control_rom;  // Endereço ROM (8 bits) vindo da UC
    assign data_out = reg_b;             // Registrador B envia dado para RAM (escrita)
	 */

endmodule
