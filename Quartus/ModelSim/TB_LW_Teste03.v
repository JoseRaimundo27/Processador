module TB_LW_Teste03;

    // Declaracao dos sinais de teste
    reg clk1;                      // Clock principal
    reg clk2;                      // Clock da memoria de instrução
    reg rst;                       // Reset
    //reg BranchTaken;               // Sinal de branch
    wire BranchTaken;               // Sinal de branch
    //reg [7:0] BranchTarget;        // Endereço de destino do branch
    wire [7:0] BranchTarget;        // Endereço de destino do branch
    wire [31:0] IF_ID_Instruction; // Instrução de saida
    wire [7:0] IF_ID_PC;           // Contador de programa (PC)
    wire [31:0] ID_EX_ReadData1;
    wire [31:0] ID_EX_SignExtImm;
    wire [4:0] ID_EX_Rd;
    wire [4:0] ID_EX_Rb;
    wire [7:0] ID_EX_PC;
    wire [4:0] ID_EX_ALUOp;
    wire ID_EX_ALUSrc;
    wire EX_MEM_MemRead;
    wire [31:0] EX_MEM_ALUResult;
    

    // Instanciação do módulo IF_Stage
    IF_STAGE duv_IF_STAGE (
        .BranchTaken(BranchTaken),
        .clk_ROM(clk2),
        .clk(clk1),
        .rst(rst),
        .BranchTarget(BranchTarget),
        .IF_ID_Instruction(IF_ID_Instruction),
        .IF_ID_PC(IF_ID_PC)
    );

    ID_STAGE duv_ID_STAGE (
        .RegWrite(),
        .clk(clk1),
        .rst(rst),
        .IF_ID_Instruction1(IF_ID_Instruction),
        .IF_ID_PC4(IF_ID_PC),
        .writeData(),
        .writeReg(),
        .ID_EX_RegDst(),
        .ID_EX_ALUSrc(ID_EX_ALUSrc),
        .ID_EX_MemToReg(),
        .ID_EX_RegWrite(),
        .ID_EX_MemRead(),
        .ID_EX_MemWrite(),
        .ID_EX_Branch(),
        .ID_EX_ALUOp(ID_EX_ALUOp),
        .ID_EX_PC(ID_EX_PC),
        .ID_EX_Rb(ID_EX_Rb),
        .ID_EX_Rd(ID_EX_Rd),
        .ID_EX_ReadData1(ID_EX_ReadData1),
        .ID_EX_ReadData2(),
        .ID_EX_SignExtImm(ID_EX_SignExtImm)
    );

    EX_STAGE duv_EX_STAGE (
        .ID_EX_RegDst(),
        .ID_EX_ALUSrc(ID_EX_ALUSrc),
        .ID_EX_MemtoReg(),
        .ID_EX_RegWrite(),
        .ID_EX_MemRead(),
        .ID_EX_MemWrite(),
        .ID_EX_Branch(),
        .clk(clk1),
        .rst(rst),
        .ID_EX_ALUOp(ID_EX_ALUOp),
        .ID_EX_PC(ID_EX_PC),
        .ID_EX_Rb(ID_EX_Rb),
        .ID_EX_Rd(ID_EX_Rd),
        .ID_EX_ReadData1(ID_EX_ReadData1),
        .ID_EX_ReadData2(),
        .ID_EX_SignExtImm(ID_EX_SignExtImm),
        .EX_MEM_MemWriteOut(),
        .EX_MEM_MemtoRegOut(),
        .EX_MEM_RegWrite(),
        .EX_MEM_MemReadOut(EX_MEM_MemRead),
        .EX_MEM_Branch(BranchTaken),
        .EX_MEM_ALUResult(EX_MEM_ALUResult),
        .EX_MEM_BranchTarget(BranchTarget),
        .EX_MEM_WriteData(),
        .EX_MEM_WriteReg()
    );

    ProcessadorPipeline_SemMEM duv (
        .clk_ROM(clk2),
        .clk(clk1),
        .rst(rst),
        .RegWrite(),
        .writeData(),
	    .writeReg(),
	    .EX_MEM_MemWriteOut(),
	    .EX_MEM_MemtoRegOut(),
	    .EX_MEM_RegWrite(),
	    .EX_MEM_MemReadOut(EX_MEM_MemRead),
	    .EX_MEM_ALUResult(EX_MEM_ALUResult),
	    .EX_MEM_WriteData(),
	    .EX_MEM_WriteReg()
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
        //BranchTarget = 8'd16;    // Endereço de desvio
        //BranchTaken = 0;         // Branch inicialmente não tomado

        $display("Resetando:");
        #20; // Tempo aumentado para garantir inicialização

        rst = 0;
        #20;

        $display("Ler primeira Instrução:");
        #40;

        // Teste de branch
        $display("Executando branch:");
        //BranchTaken = 1;
        #20;
        //BranchTaken = 0;

        // Finaliza a simulação
        $finish;
    end

    // Monitoramento dos sinais
    initial begin
        $monitor("Time=%0t | rst=%b\nIF_STAGE: BranchTaken=%b | BranchTarget=%d | IF_ID_PC=%d | IF_ID_Instruction=%b\nID_STAGE: | ID_EX_ReadData1=%b | ID_EX_SignExtImm=%b | ID_EX_Rd=%b | ID_EX_Rb=%b | ID_EX_PC=%d\nEX_STAGE: | ID_EX_ALUOp=%b | ID_EX_ALUSrc=%b | EX_MEM_MemRead=%b | EX_MEM_ALUResult=%b",
            $time, rst, BranchTaken, BranchTarget, IF_ID_PC, IF_ID_Instruction,
            ID_EX_ReadData1, ID_EX_SignExtImm, ID_EX_Rd, ID_EX_Rb, ID_EX_PC,
            ID_EX_ALUOp, ID_EX_ALUSrc, EX_MEM_MemRead, EX_MEM_ALUResult
        );
    end

endmodule
