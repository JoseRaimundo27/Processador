module ALU (
    input [31:0] A,          // Primeiro operando
    input [31:0] B,          // Segundo operando
    input [4:0] ALUControl,  // Sinal de controle para definir a operação
    output reg [31:0] ALUResult, // Resultado da operação
    output reg [4:0] RFlags        // Vetor de Flags que Indicam [overflow/underflow, above, below, equal, error]
);
    always @(*) begin
        ALUResult = 0;
        RFlags = 5'b00000;     // Inicializacao das flags com 0

        case (ALUControl)
            // Operacoes de Transferencia de Dados
            // Operacao LW_1
            5'b00000:
            // Operacao LW_2
            5'b00001:
            // Operacao LW_3
            5'b00010:
            // Operacao SW_1
            5'b00011:
            // Operacao SW_2
            5'b00100:
            // Operacao MOV
            5'b00101:

            // Operacoes Aritmeticas
            // Operacao ADD
            5'b00110: begin
                ALUResult = A + B;
                RFlags[4] = (A[31] == B[31]) && (ALUResult[31] != A[31]);  // Overflow
            end 

            // Operacao SUB
            5'b00111: begin
                ALUResult = A - B;
                RFlags[3] = (A < B);            // Underflow
                RFlags[2] = (A > B);            // Above
                RFlags[1] = (A < B);            // Under
            end

            // Operacao MULT
            5'b01000: begin
                ALUResult = A * B;
                RFlags[4] = (Result < A) || (Result < B); // Overflow
                RFlags[0] = (A == 0 || B == 0);           // Error (caso um operando seja 0)
            end

            // Operacao DIV
            5'b01001: begin
                if (B == 0) begin
                    ALUResult = 0;
                    RFlags[0] = 1;              // Error (Divisao por 0)
                end

                else begin
                    ALUResult = A / B;
                    RFlags[3] = (A < B);        // Underflow
                end
            end

            // Operacoes Logicas
            // Operacao AND
            5'b01010: ALUResult = A & B;

            // Operacao OR
            5'b01011: ALUResult = A | B; 

            // Operacao SHL
            5'b01100:
                ALUResult = A << B;

            // Operacao SHR
            5'b01101: ALUResult = A >> B;

            // Operacao CMP
            5'b01110: begin
                ALUResult = (A == B) ? 1 : 0;
                RFlags[2] = (A > B);            // Above
                RFlags[1] = (A < B);            // Under
                RFlags[0] = (A == B);           // Error se os valores forem iguais
            end
            // Operacao NOT
            5'b01111: ALUResult = ~A;

            // Operacoes de Transferencia de Controle
            // Operacao JR
            5'b10000:
            // Operacao JPC
            5'b10001:
            // Operacao BRFL
            5'b10010:
            // Operacao CALL
            5'b10011:
            // Operacao RET
            5'b10100:
            // Operacao NOP
            5'b10101:

            // Case Default
            default: ALUResult = 0;           // Operação padrão
        endcase

        // Atualiza a flag Zero
        Zero = (ALUResult == 0) ? 1'b1 : 1'b0;
    end
endmodule