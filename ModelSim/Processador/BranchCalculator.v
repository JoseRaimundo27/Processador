module ALU32Bits(
    //input wire reset,
    input wire signed [31:0] data1, data2,
    input wire [4:0] ALUControl,
    output reg zero,
    output reg signed [31:0] ALUResult
);
reg signed [63:0] MUL_Result;
reg [4:0] RFlagsStored;
reg [4:0] RFlags; // [overflow, above, below, equal, error]

// Definição de parâmetros
parameter LW_1  = 5'b00000,  // Load Word - Estado 1
          LW_2  = 5'b00001,  // Load Word - Estado 2
          LW_3  = 5'b00010,  // Load Word - Estado 3
          SW_1  = 5'b00011,  // Store Word - Estado 1
          SW_2  = 5'b00100,  // Store Word - Estado 2
          MOV   = 5'b00101,  // Move
          ADD   = 5'b00110,  // Add
          SUB   = 5'b00111,  // Subtract
          MUL   = 5'b01000,  // Multiply
          DIV   = 5'b01001,  // Divide
          AND   = 5'b01010,  // AND
          OR    = 5'b01011,  // OR
          SHL   = 5'b01100,  // Shift Left
          SHR   = 5'b01101,  // Shift Right
          CMP   = 5'b01110,  // Compare
          NOT   = 5'b01111,  // NOT
          JR    = 5'b10000,  // Jump Register
          JPC   = 5'b10001,  // Jump on Condition
          BRFL  = 5'b10010,  // Branch Flag
          CALL  = 5'b10011,  // Call
          RET   = 5'b10100,  // Return
          NOP   = 5'b10101;  // No Operation

// Reset sincrono
//always @(posedge reset) begin
//    zero = 1'b0;
//    RFlags = 5'b00000;
//    ALUResult = 32'b0;
//end

// Operações da ALU
always @(ALUControl, data1, data2) begin
    // Limpar flags inicialmente
    zero = 1'b0;
    RFlags = 5'b00000;

    case (ALUControl)
        LW_1: begin
            // Load Word com Endereco Base Deslocado (Incremento de 8 bits por instrucao)
            ALUResult = data1 + data2;
        end

        LW_2: begin
            // Load Word com Endereco Direto
            ALUResult = data1;
        end

        LW_3: begin
            // Load Word com Endereco Imediato
            ALUResult = data1;
        end

        SW_1: begin
            // Set Word com Endereço Base Deslocado (Incremento de 8 bits por instrucao)
            ALUResult = data1 + 8;
        end

        SW_2: begin
            // Set Word com Endereco Direto
            ALUResult = data1;
        end

        MOV: begin
            // Transfere valores contatenados de endereco de memória
            ALUResult = {data1[4:0],data2[4:0]};
        end

        ADD: begin
            ALUResult = data1 + data2;

            // Overflow: quando os sinais dos operandos e do resultado não batem
            if ((data1[31] == data2[31]) && (ALUResult[31] != data1[31])) begin
                RFlags[0] = 1'b1; // Overflow
                RFlags[4] = 1'b1; // Error
            end

            // Verificacao da flag 0
            if (ALUResult == 0)
                zero = 1'b1;
        end

        SUB: begin
            ALUResult = data1 - data2;

            // Overflow na subtração
            if ((data1[31] != data2[31]) && (ALUResult[31] != data1[31])) begin
                RFlags[0] = 1'b1; // Overflow
                RFlags[4] = 1'b1; // Error
            end
            // Verifica flag zero
            if (ALUResult == 0)
                zero = 1'b1;
        end

        MUL: begin
            MUL_Result = data1 * data2;
            ALUResult = MUL_Result[31:0];

            // Apenas verifica overflow na multiplicação
            if (MUL_Result[63:32] != 0) begin
                RFlags[0] = 1'b1;   // Overflow
                RFlags[4] = 1'b1;   // Error
            end
            // Verifica flag zero
            if (ALUResult == 0)
                zero = 1'b1;
        end

        DIV: begin
            if (data2 == 0) begin
                ALUResult = 0;
                RFlags[4] = 1'b1; // Erro (divisão por zero)
            end 
            else begin
                ALUResult = data1 / data2;
            end
            // Verifica flag zero
            if (ALUResult == 0)
                zero = 1'b1;
        end

        AND: begin
            ALUResult = data1 & data2;
            // Verifica flag zero
            if (ALUResult == 0)
                zero = 1'b1;
        end

        OR: begin
            ALUResult = data1 | data2;
            // Verifica flag zero
            if (ALUResult == 0)
                zero = 1'b1;
        end

        SHL: begin
            ALUResult = data1 << data2;
        end

        SHR: begin
            ALUResult = data2 >> data2;
        end

        CMP: begin
            // Compara valores
            if (data1 == data2)
                RFlags[3] = 1'b1; // Igual
            else if (data1 > data2)
                RFlags[1] = 1'b1; // Acima
            else
                RFlags[2] = 1'b1; // Abaixo
        end

        NOT: begin
            ALUResult = ~data1;
        end

        JR: begin
            // Desvio incondicional para endereco em data1
            ALUResult = data1;
            zero = 1'b0;
        end

        JPC: begin
            // Desvio incondicional relativo ao PC
            ALUResult = data1 + data2;
            zero = 1'b0;
        end

        BRFL: begin
            // Verifica se RFlags é igual à máscara fornecida em data2
            if (RFlagsStored == data2[4:0]) begin
                zero = 1'b1; // Ativa o sinal de salto
                ALUResult = data1; // O endereço de salto será gerenciado em outro estágio
            end else begin
                ALUResult = 32'b0; // Nenhum salto
                zero = 1'b1;
            end
        end

        CALL: begin
            // Chamada de Subrotina
            ALUResult = data1;
            zero = 1'b1;
        end

        default: begin
            // Operacao Inválida
            ALUResult = 0;
            zero = 1'b1;
        end
    endcase

    RFlagsStored = RFlags;
end
endmodule
