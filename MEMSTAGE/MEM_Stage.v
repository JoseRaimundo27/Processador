module MEM_Stage (
    input wire clk,                        
    input wire rst,                    
    input wire [31:0] EX_MEM_ALUResult,     // Resultado da ALU (endereço de memória ou resultado de operação)
    input wire [31:0] EX_MEM_ReadData2,     // Dados a serem escritos na memória ou operados
    input wire [4:0] EX_MEM_WriteReg,       // Registrador a ser escrito
    input wire EX_MEM_MemRead,              // Controle de leitura de memória
    input wire EX_MEM_MemWrite,             // Controle de escrita na memória
    input wire EX_MEM_MemToReg,             // Controle para decidir se o dado vem da memória ou ALU
    input wire EX_MEM_RegWrite,             // Controle de escrita no banco de registradores
    output wire [31:0] MEM_WB_ALUResult,    // Resultado da ALU para o estágio WB
    output wire [31:0] MEM_WB_ReadData,     // Dados lidos da memória para o estágio WB
    output wire [4:0] MEM_WB_WriteReg,      // Registrador de destino para o estágio WB
    output wire MEM_WB_MemToReg,            // Controle MemToReg para o estágio WB
    output wire MEM_WB_RegWrite             // Controle RegWrite para o estágio WB
);
    wire [31:0] ReadData;                  // Dados lidos da memória

    // Data Memory - Acessa a memória de dados
    RAM_Data data_memory (
        .address(EX_MEM_ALUResult[7:0]),    // O endereço para leitura/escrita da memória (8 bits)
        .clock(clk),                        // Clock para a memória
        .data(EX_MEM_ReadData2),            // Dados a serem escritos na memória
        .wren(EX_MEM_MemWrite),             // Ativa a escrita da memória
        .q(ReadData)                        // Dados lidos da memória
    );

    // MEM/WB Pipeline Register - Armazena os dados a serem passados para o estágio WB
    MEM_WB_Register mem_wb (
        .clk(clk),                          // Clock para sincronizar o pipeline
        .rst(rst),                          // Sinal de reset
        .inALUResult(EX_MEM_ALUResult),     // Resultado da ALU (passa para o estágio WB)
        .inReadData(ReadData),              // Dados lidos da memória (passam para o estágio WB)
        .inWriteReg(EX_MEM_WriteReg),       // Registrador de destino (passa para o estágio WB)
        .inMemToReg(EX_MEM_MemToReg),       // Controle MemToReg (decide se vem da memória ou da ALU)
        .inRegWrite(EX_MEM_RegWrite),       // Controle RegWrite (decide se será escrita no banco de registradores)
        .outALUResult(MEM_WB_ALUResult),    // Saída para o estágio WB
        .outReadData(MEM_WB_ReadData),      // Saída para o estágio WB
        .outWriteReg(MEM_WB_WriteReg),      // Saída para o estágio WB
        .outMemToReg(MEM_WB_MemToReg),      // Saída para o estágio WB
        .outRegWrite(MEM_WB_RegWrite)       // Saída para o estágio WB
    );

endmodule
