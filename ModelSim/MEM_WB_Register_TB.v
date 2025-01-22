`timescale 1ns / 1ps

module MEM_WB_Register_tb;

    // Declaração dos sinais
    reg clk;
    reg rst;
    reg [31:0] inALUResult;
    reg [31:0] inReadData;
    reg [4:0] inWriteReg;
    reg inMemToReg;
    reg inRegWrite;

    wire [31:0] outALUResult;
    wire [31:0] outReadData;
    wire [4:0] outWriteReg;
    wire outMemToReg;
    wire outRegWrite;

    // Instanciação do módulo MEM_WB_Register
    MEM_WB_Register uut (
        .clk(clk),
        .rst(rst),
        .inALUResult(inALUResult),
        .inReadData(inReadData),
        .inWriteReg(inWriteReg),
        .inMemToReg(inMemToReg),
        .inRegWrite(inRegWrite),
        .outALUResult(outALUResult),
        .outReadData(outReadData),
        .outWriteReg(outWriteReg),
        .outMemToReg(outMemToReg),
        .outRegWrite(outRegWrite)
    );

    // Geração do clock
    initial clk = 0;
    always #5 clk = ~clk; // Clock com período de 10 ns

    // Sequência de teste
    initial begin
        // Inicializa os sinais
        rst = 1;
        inALUResult = 32'b0;
        inReadData = 32'b0;
        inWriteReg = 5'b0;
        inMemToReg = 0;
        inRegWrite = 0;

        // Aplica reset
        #10 rst = 0;

        // Teste 1: Escrevendo valores no registrador
        inALUResult = 32'hA5A5A5A5;
        inReadData = 32'h5A5A5A5A;
        inWriteReg = 5'b10101;
        inMemToReg = 1;
        inRegWrite = 1;
        #10;

        // Verifica os valores armazenados
        $display("Teste 1:");
        $display("outALUResult: %h (esperado: A5A5A5A5)", outALUResult);
        $display("outReadData: %h (esperado: 5A5A5A5A)", outReadData);
        $display("outWriteReg: %b (esperado: 10101)", outWriteReg);
        $display("outMemToReg: %b (esperado: 1)", outMemToReg);
        $display("outRegWrite: %b (esperado: 1)", outRegWrite);

        // Teste 2: Aplica novos valores
        inALUResult = 32'h12345678;
        inReadData = 32'h87654321;
        inWriteReg = 5'b01010;
        inMemToReg = 0;
        inRegWrite = 0;
        #10;

        // Verifica os valores armazenados
        $display("Teste 2:");
        $display("outALUResult: %h (esperado: 12345678)", outALUResult);
        $display("outReadData: %h (esperado: 87654321)", outReadData);
        $display("outWriteReg: %b (esperado: 01010)", outWriteReg);
        $display("outMemToReg: %b (esperado: 0)", outMemToReg);
        $display("outRegWrite: %b (esperado: 0)", outRegWrite);

        // Finaliza a simulação
        #20;
        $stop;
    end

endmodule
