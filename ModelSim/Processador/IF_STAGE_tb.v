//`timescale 1ns/1ps

module IF_STAGE_tb;

    // Declaração dos sinais de teste
    reg clk1;                      // Clock principal
    reg clk2;                      // Clock da memória de instrução
    reg rst;                       // Reset
    reg [7:0] BranchTarget;        // Endereço alvo em caso de desvio (branch)
    reg BranchTaken;               // Sinal para indicar se o branch foi tomado
    wire [7:0] IF_ID_PC;           // Saída: PC para próximo estágio
    wire [31:0] IF_ID_Instruction; // Saída: instrução para próximo estágio

    // Instanciação do módulo IF_Stage
    IF_STAGE dut (
        .clk(clk1),
        .clk_ROM(clk2),
        .rst(rst),
        .BranchTarget(BranchTarget),
        .BranchTaken(BranchTaken),
        .IF_ID_PC(IF_ID_PC),
        .IF_ID_Instruction(IF_ID_Instruction)
    );

    // Geração do clk1 (período = 10 unidades de tempo)
    initial begin
        clk1 = 0;
        forever #5 clk1 = ~clk1; // Toggle a cada 5 unidades de tempo
    end

    // Geração do clk2 (período = 5 unidades de tempo)
    initial begin
        clk2 = 0;
        forever #2.5 clk2 = ~clk2; // Toggle a cada 2.5 unidades de tempo
    end

    // Estímulos de teste
    initial begin
        // Inicialização dos sinais
        rst = 1;                // Ativa reset
        BranchTarget = 8'd16;    // Endereço de desvio
        BranchTaken = 0;         // Branch inicialmente não tomado

        // Aguarda algumas bordas de clock
        #10;
        rst = 0;                // Desativa reset

        // Teste 1: Caminho normal (sem desvio)
        #10;
        BranchTaken = 0;         // Branch não tomado
        $display("Teste 1: Caminho normal");
        #20;

        // Teste 2: Branch taken
        #10;
        BranchTaken = 1;         // Ativa branch
        $display("Teste 2: Branch taken");
        #20;

        // Teste 3: Desabilitar escrita no registrador IF/ID
        #10;
        $display("Teste 3: IF_ID_WriteEnable desabilitado");
        #20;

        // Teste 4: Reset novamente
        #10;
        rst = 1;                 // Ativa reset
      	BranchTaken = 0;
        $display("Teste 4: Reset ativado");
        #10;
        rst = 0;
      	 
        #20;

        // Finaliza a simulação
        $finish;
    end

    // Monitoramento dos sinais
    initial begin
      $monitor("Time=%0t | rst=%b | BranchTaken=%b | IF_ID_PC=%d | IF_ID_Instruction=%h",
                $time, rst, BranchTaken, IF_ID_PC, IF_ID_Instruction);
    end

endmodule
