module EX_MEM_Register (
    input clk, rst,
    input [31:0] inALUResult,     // Entrada: resultado da ALU
    input [31:0] inReadData2,     // Entrada: dado a ser escrito na memória
    input [4:0] inWriteReg,       // Entrada: registrador destino
    input Zero, Branch, MemRead, MemWrite, MemToReg, RegWrite, // Sinais de controle
    output reg [31:0] outALUResult,  // Propagação do resultado da ALU
    output reg [31:0] outReadData2,  // Propagação do dado a ser escrito na memória
    output reg [4:0] outWriteReg,    // Propagação do registrador destino
    output reg outZero,              // Propagação da flag Zero
    output reg outBranch, outMemRead, outMemWrite, // Propagação dos sinais de controle
    output reg outMemToReg, outRegWrite
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            outALUResult <= 0;
            outReadData2 <= 0;
            outWriteReg <= 0;
            outZero <= 0;
            outBranch <= 0;
            outMemRead <= 0;
            outMemWrite <= 0;
            outMemToReg <= 0;
            outRegWrite <= 0;
        end else begin
            outALUResult <= inALUResult;
            outReadData2 <= inReadData2;
            outWriteReg <= inWriteReg;
            outZero <= Zero;
            outBranch <= Branch;
            outMemRead <= MemRead;
            outMemWrite <= MemWrite;
            outMemToReg <= MemToReg;
            outRegWrite <= RegWrite;
        end
    end
endmodule