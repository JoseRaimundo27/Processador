module MEM_Stage (
    input wire clk,                        
    input wire rst,                    
    input wire [31:0] EX_MEM_ALUResult,     // Resultado da ALU (endere�o de mem�ria ou resultado de opera��o)
    input wire [31:0] EX_MEM_ReadData2,     // Dados a serem escritos na mem�ria ou operados
    input wire [4:0] EX_MEM_WriteReg,       // Registrador a ser escrito
    input wire EX_MEM_MemRead,              // Controle de leitura de mem�ria
    input wire EX_MEM_MemWrite,             // Controle de escrita na mem�ria
    input wire EX_MEM_MemToReg,             // Controle para decidir se o dado vem da mem�ria ou ALU
    input wire EX_MEM_RegWrite,             // Controle de escrita no banco de registradores
    output wire [31:0] MEM_WB_ALUResult,    // Resultado da ALU para o est�gio WB
    output wire [31:0] MEM_WB_ReadData,     // Dados lidos da mem�ria para o est�gio WB
    output wire [4:0] MEM_WB_WriteReg,      // Registrador de destino para o est�gio WB
    output wire MEM_WB_MemToReg,            // Controle MemToReg para o est�gio WB
    output wire MEM_WB_RegWrite             // Controle RegWrite para o est�gio WB
);
    wire [31:0] ReadData;                  // Dados lidos da mem�ria

    // Data Memory - Acessa a mem�ria de dados
    RAM_Data data_memory (
        .address(EX_MEM_ALUResult[7:0]),    // O endere�o para leitura/escrita da mem�ria (8 bits)
        .clock(clk),                        // Clock para a mem�ria
        .data(EX_MEM_ReadData2),            // Dados a serem escritos na mem�ria
        .wren(EX_MEM_MemWrite),             // Ativa a escrita da mem�ria
        .q(ReadData)                        // Dados lidos da mem�ria
    );

    // MEM/WB Pipeline Register - Armazena os dados a serem passados para o est�gio WB
    MEM_WB_Register mem_wb (
        .clk(clk),                          // Clock para sincronizar o pipeline
        .rst(rst),                          // Sinal de reset
        .inALUResult(EX_MEM_ALUResult),     // Resultado da ALU (passa para o est�gio WB)
        .inReadData(ReadData),              // Dados lidos da mem�ria (passam para o est�gio WB)
        .inWriteReg(EX_MEM_WriteReg),       // Registrador de destino (passa para o est�gio WB)
        .inMemToReg(EX_MEM_MemToReg),       // Controle MemToReg (decide se vem da mem�ria ou da ALU)
        .inRegWrite(EX_MEM_RegWrite),       // Controle RegWrite (decide se ser� escrita no banco de registradores)
        .outALUResult(MEM_WB_ALUResult),    // Sa�da para o est�gio WB
        .outReadData(MEM_WB_ReadData),      // Sa�da para o est�gio WB
        .outWriteReg(MEM_WB_WriteReg),      // Sa�da para o est�gio WB
        .outMemToReg(MEM_WB_MemToReg),      // Sa�da para o est�gio WB
        .outRegWrite(MEM_WB_RegWrite)       // Sa�da para o est�gio WB
    );

endmodule
