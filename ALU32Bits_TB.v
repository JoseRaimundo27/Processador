module ALU32Bits_tb;

    // Declaração de sinais para o módulo ALU32Bits
    reg reset;
    reg signed [31:0] data1, data2;
    reg [3:0] ALUControl;
    wire zero;
    wire signed [31:0] ALUResult;

    // Instância do módulo ALU32Bits
    ALU32Bits uut (
        .reset(reset),
        .data1(data1),
        .data2(data2),
        .ALUControl(ALUControl),
        .zero(zero),
        .ALUResult(ALUResult)
    );

    // Bloco de inicialização
    initial begin
        // Inicializando sinais
        reset = 1;
        data1 = 0;
        data2 = 0;
        ALUControl = 0;
        
        // Aplicar reset
        #5 reset = 0;
        
        // Testar operação MOV
        #5;
        ALUControl = 5'b00101;  // MOV
        data1 = 32'hA5A5A5A5;
        
        // Testar operação ADD
        #5;
        ALUControl = 5'b00110;  // ADD
        data1 = 32'h00000010;
        data2 = 32'h00000020;
        
        // Testar operação SUB
        #5;
        ALUControl = 5'b00111;  // SUB
        data1 = 32'h00000030;
        data2 = 32'h00000020;
        
        // Testar operação MUL
        #5;
        ALUControl = 5'b01000;  // MUL
        data1 = 32'h00000010;
        data2 = 32'h00000004;
        
        // Testar operação DIV
        #5;
        ALUControl = 5'b01001;  // DIV
        data1 = 32'h00000030;
        data2 = 32'h00000006;
        
        // Testar operação AND
        #5;
        ALUControl = 5'b01010;  // AND
        data1 = 32'hF0F0F0F0;
        data2 = 32'h0F0F0F0F;
        
        // Testar operação OR
        #5;
        ALUControl = 5'b01011;  // OR
        data1 = 32'hF0F0F0F0;
        data2 = 32'h0F0F0F0F;
        
        // Testar operação SHL
        #5;
        ALUControl = 5'b01100;  // SHL
        data1 = 32'h00000010;
        data2 = 5; // Deslocar 5 bits à esquerda
        
        // Testar operação SHR
        #5;
        ALUControl = 5'b01101;  // SHR
        data1 = 32'h00000010;
        data2 = 3; // Deslocar 3 bits à direita
        
        // Testar operação CMP (comparação)
        #5;
        ALUControl = 5'b01110;  // CMP
        data1 = 32'h00000010;
        data2 = 32'h00000010; // Iguala os dois valores
        
        // Testar erro de divisão por zero
        #5;
        ALUControl = 5'b01001;  // DIV
        data1 = 32'h00000030;
        data2 = 32'h00000000; // Divisão por zero

        // Teste de operação de erro genérico
        #5;
        ALUControl = 5'b10101;  // NOP (sem operação)
        data1 = 32'h00000000;
        data2 = 32'h00000000;

        // Encerrar o testbench
        #5;
        $finish;
    end

    // Monitoramento das variáveis para visualização
    initial begin
        $monitor("Time=%0t | ALUControl=%b | data1=%h | data2=%h | ALUResult=%h | zero=%b | RFlags=%b", 
                 $time, ALUControl, data1, data2, ALUResult, zero, RFlags);
    end

endmodule