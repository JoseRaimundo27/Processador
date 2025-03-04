module TB_LW_Teste01;

    // Declaracao dos sinais de teste
    reg clk1;                      // Clock principal
    reg clk2;                      // Clock da memória de instrução
    reg rst;                       // Reset
    reg BranchTaken;               // Sinal de branch
    reg [7:0] BranchTarget;        // Endereço de destino do branch
    wire [31:0] IF_ID_Instruction; // Instrução de saida
    wire [7:0] IF_ID_PC;           // Contador de programa (PC)

    // Instanciacao do modulo IF_Stage
   
    IF_STAGE duv_IF_STAGE (
        .BranchTaken(BranchTaken),
        .clk_ROM(clk2),
        .clk(clk1),
        .rst(rst),
        .BranchTarget(BranchTarget),
        .IF_ID_Instruction(IF_ID_Instruction),
        .IF_ID_PC(IF_ID_PC)
    );

    ProcessadorPipeline_SemID duv (
        .clk_ROM(clk2),
        .clk(clk1),
        .rst(rst),
        .BranchTaken(BranchTaken),
        .BranchTarget(BranchTarget),
        .IF_ID_Instruction(IF_ID_Instruction),
        .IF_ID_PC(IF_ID_PC)
    );    

    // Geracao do clk1 (periodo = 10 unidades de tempo)
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

        // Inicializacao dos sinais
        rst = 1;                // Ativa reset
        BranchTarget = 8'd16;    // Endereco de desvio
        BranchTaken = 0;         // Branch inicialmente nãao tomado

        $display("Resetando: ");
        #10;

        rst = 0;                
        #10;

        $display("Ler primeira Instrucao: ");
        #20;


        // Finaliza a simulação
        $finish;
    end

    // Monitoramento dos sinais
    initial begin
        $monitor("Time=%0t | rst=%b | BranchTaken=%b | BranchTarget=%b | IF_ID_PC=%d | IF_ID_Instruction=%h",
                $time, rst, BranchTaken, BranchTarget, IF_ID_PC, IF_ID_Instruction);
    end

endmodule