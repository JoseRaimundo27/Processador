module EX_Stage (
    input wire clk,                   
    input wire rst,               
    input wire [31:0] ID_EX_ReadData1, // Valor do primeiro operando (registrador fonte 1)
    input wire [31:0] ID_EX_ReadData2, // Valor do segundo operando (registrador fonte 2)
    input wire [31:0] ID_EX_SignExtImm, // Valor imediato estendido (entrada alternativa para a ALU)
    input wire [4:0] ID_EX_Rb,         // Campo do registrador destino (caso RegDst = 0)
    input wire [4:0] ID_EX_Rd,         // Campo do registrador destino (caso RegDst = 1)
    input wire ID_EX_RegDst,           // Seleciona qual registrador será destino
    input wire ID_EX_ALUSrc,           // Seleciona a segunda entrada da ALU (ReadData2 ou imediato)
    input wire [4:0] ID_EX_ALUOp,      // Operação a ser realizada pela ALU
    input wire ID_EX_Branch,           // Define se a instrução é um branch
    input wire ID_EX_MemRead,          // Sinal de controle para leitura de memória
    input wire ID_EX_MemWrite,         // Sinal de controle para escrita de memória
    input wire ID_EX_MemToReg,         // Seleciona se o dado da memória ou da ALU será escrito no registrador
    input wire ID_EX_RegWrite,         // Permite escrita no banco de registradores

    output wire [31:0] EX_MEM_ALUResult, // Resultado da ALU
    output wire [31:0] EX_MEM_ReadData2, // Dado a ser escrito na memória (caso MemWrite seja ativo)
    output wire [4:0] EX_MEM_WriteReg,   // Registrador de destino para escrita
    output wire EX_MEM_Zero,             // Flag Zero da ALU (resultado da operação é zero)
    output wire EX_MEM_Branch,           // Propagação do sinal de Branch
    output wire EX_MEM_MemRead,          // Propagação do sinal de MemRead
    output wire EX_MEM_MemWrite,         // Propagação do sinal de MemWrite
    output wire EX_MEM_MemToReg,         // Propagação do sinal de MemToReg
    output wire EX_MEM_RegWrite          // Propagação do sinal de RegWrite
);
    // Fio para a segunda entrada da ALU (ReadData2 ou SignExtImm)
    wire [31:0] ALUInputB;
    // Resultado da ALU
    wire [31:0] ALUResult;
    // Flag Zero: indica se o resultado da ALU é zero
    wire Zero;
    // Registrador de destino após a seleção (Rt ou Rd)
    wire [4:0] WriteReg;

    // Multiplexador para selecionar a segunda entrada da ALU
    Mux2to1 muxALUInput (
        .in0(ID_EX_ReadData2),       // Registrador fonte 2 (ReadData2)
        .in1(ID_EX_SignExtImm),      // Imediato estendido
        .select(ID_EX_ALUSrc),       // Sinal de controle (ALUSrc)
        .out(ALUInputB)              // Saída para a ALU
    );

    // Unidade Lógica Aritmética (ALU): realiza a operação especificada
    ALU alu (
        .A(ID_EX_ReadData1),         // Primeiro operando
        .B(ALUInputB),               // Segundo operando (registrador ou imediato)
        .ALUControl(ID_EX_ALUOp),    // Operação a ser realizada
        .ALUResult(ALUResult),       // Resultado da operação
        .Zero(Zero)                  // Flag Zero
    );

    // Multiplexador para selecionar o registrador destino
    Mux2to1_4bit muxriteReg (
      	.in0(ID_EX_Rb),              // Registrador destino Rt
        .in1(ID_EX_Rd),              // Registrador destino Rd
        .select(ID_EX_RegDst),       // Sinal de controle (RegDst)
        .out(WriteReg)               // Saída para EX/MEM
    );

    // Registrador EX/MEM: armazena os resultados e sinais de controle para o próximo estágio
    EX_MEM_Register ex_mem (
        .clk(clk),                  
        .rst(rst),          
        .inALUResult(ALUResult),     // Resultado da ALU
        .inReadData2(ID_EX_ReadData2), // Dados do registrador fonte 2
        .inWriteReg(WriteReg),       // Registrador destino
        .Zero(Zero),                 // Flag Zero
        .Branch(ID_EX_Branch),       // Sinal de controle para Branch
        .MemRead(ID_EX_MemRead),     // Sinal de controle para leitura de memória
        .MemWrite(ID_EX_MemWrite),   // Sinal de controle para escrita de memória
        .MemToReg(ID_EX_MemToReg),   // Sinal de controle para escrita no registrador
        .RegWrite(ID_EX_RegWrite),   // Sinal de controle para escrita no registrador
        .outALUResult(EX_MEM_ALUResult), // Propagação do resultado da ALU
        .outReadData2(EX_MEM_ReadData2), // Propagação do dado a ser escrito na memória
        .outWriteReg(EX_MEM_WriteReg),   // Propagação do registrador destino
        .outZero(EX_MEM_Zero),           // Propagação da flag Zero
        .outBranch(EX_MEM_Branch),       // Propagação do sinal de Branch
        .outMemRead(EX_MEM_MemRead),     // Propagação do sinal de MemRead
        .outMemWrite(EX_MEM_MemWrite),   // Propagação do sinal de MemWrite
        .outMemToReg(EX_MEM_MemToReg),   // Propagação do sinal de MemToReg
        .outRegWrite(EX_MEM_RegWrite)    // Propagação do sinal de RegWrite
    );

endmodule
