module IF_Stage (
    input wire clk,                       // Clock do sistema para sincronização
    input wire rst,                  // Sinal de reset
    input wire [31:0] branchTarget,      // Endereço calculado em caso de desvio (branch)
    input wire BranchTaken,              // Indica se o branch foi tomado
    input wire PCSrc,                    // Controla a seleção do próximo valor do PC
    input wire PCWrite,                  // Habilita a leitura da memória de instrução
    input wire IF_ID_WriteEnable,        // Habilita a escrita no registrador de pipeline IF/ID
    output wire [31:0] IF_ID_PC,         // Endereço do PC para o próximo estágio (ID)
    output wire [31:0] IF_ID_Instruction // Instrução buscada na memória para o próximo estágio (ID)
);

    // Declaração de sinais internos
    wire [31:0] currentPC;       // Armazena o valor atual do PC
    wire [31:0] nextPC;          // Armazena o próximo valor calculado do PC
    wire [31:0] incrementedPC;   // Valor do PC incrementado (próximo endereço sequencial)
    wire [31:0] instruction;     // Instrução lida da memória

    // Contador de Programa (PC)
    // Módulo responsável por armazenar o endereço da próxima instrução.
    // O valor do PC é atualizado com base em 'nextPC' se 'PCWrite' for ativo.
    ProgramCounter pc (
        .clk(clk),
        .rst(rst),
        .nextPC(nextPC),
        .PCWrite(PCWrite),
        .currentPC(currentPC)
    );

    // Somador do PC
    // Incrementa o valor do PC em +1 (ou +4 dependendo da arquitetura) para buscar a próxima instrução.
    PC_Adder pcAdder (
        .inPC(currentPC),
        .outPC(incrementedPC)
    );

    // MUX para seleção do próximo valor do PC
    // Seleciona entre o endereço incrementado (incrementedPC) e o alvo de branch (branchTarget),
    // com base no sinal 'PCSrc', que indica se um branch foi tomado.
    Mux2to1 pcMux (
        .in0(incrementedPC),     // Caminho normal: próxima instrução sequencial
        .in1(branchTarget),      // Caminho alternativo: endereço de desvio
        .sel(BranchTaken),       // Seleciona o próximo endereço do PC em caso de desvio
        .out(nextPC)
    );

    // Registrador de pipeline IF/ID
    // Armazena o valor do PC incrementado e a instrução buscada para o próximo estágio (ID).
    // A escrita nos registradores é controlada por 'IF_ID_WriteEnable'.
    IF_ID_Register if_id (
        .clk(clk),
        .rst(rst),                // Reset para limpar os registros
        .inPC(incrementedPC),             // Valor do PC incrementado
        .inInstruction(instruction),      // Instrução buscada da memória
        .writeEnable(IF_ID_WriteEnable),  // Habilita a escrita
        .outPC(IF_ID_PC),                 // Saída do PC para o próximo estágio
        .outInstruction(IF_ID_Instruction) // Saída da instrução para o próximo estágio
    );

endmodule