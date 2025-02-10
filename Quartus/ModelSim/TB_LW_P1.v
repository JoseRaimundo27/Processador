module TB_LW;

    // Declaracao dos sinais de teste
    reg clk1;                      // Clock principal
    reg clk2;                      // Clock da memória de instrução
    reg rst;                       // Reset
    reg BranchTaken;               // Sinal de branch
    reg [7:0] BranchTarget;       // Endereço de destino do branch
    wire [31:0] IF_ID_Instruction; // Instrução de saída
    wire [7:0] IF_ID_PC;          // Contador de programa (PC)
    wire [31:0] IF_ID_Instruction1; // Instrução de saída
    wire [7:0] IF_ID_PC4;          // Contador de programa (PC)
    wire [31:0] ID_EX_ReadData1;   // Conteudo do Reg1
    wire [31:0] ID_EX_SignExtImm;   // Conteudo do Sinal Extendido
    wire [4:0] ID_EX_Rd;   // Endereco do Reg Destino
    wire [4:0] ID_EX_Rb;   // Endereco do RegBase
    wire [7:0] ID_EX_PC;          // Contador de programa (PC) ID_EX


    // Instanciacaoo do modulo IF_Stage
   
    IF_STAGE dut_IF_STAGE (
        .clk(clk1),
        .rst(rst),
        .BranchTaken(BranchTaken),
        .clk_ROM(clk2),
        .BranchTarget(BranchTarget),
        .IF_ID_Instruction(IF_ID_Instruction),
        .IF_ID_PC(IF_ID_PC)
    );

	// Instanciando o modulo ID_Stage
    ID_STAGE dut_ID_STAGE (
        .clk(clk1),
        .rst(rst),
        .IF_ID_PC(IF_ID_PC),
        .IF_ID_Instruction(IF_ID_Instruction),
        .RegWrite(WB_RegWrite),
        .writeReg(WB_writeReg),
        .writeData(WB_writeData),
        .ID_EX_ReadData1(ID_EX_ReadData1),
        .ID_EX_ReadData2(ID_EX_ReadData2),
        .ID_EX_SignExtImm(ID_EX_SignExtImm),
        .ID_EX_Rb(ID_EX_Rb),
        .ID_EX_Rd(ID_EX_Rd),
        .ID_EX_PC(ID_EX_PC),
        .ID_EX_RegDst(ID_EX_RegDst),
        .ID_EX_ALUSrc(ID_EX_ALUSrc),
        .ID_EX_MemToReg(ID_EX_MemToReg),
        .ID_EX_RegWrite(ID_EX_RegWrite),
        .ID_EX_MemRead(ID_EX_MemRead),
        .ID_EX_MemWrite(ID_EX_MemWrite),
        .ID_EX_Branch(ID_EX_Branch),
        .ID_EX_ALUOp(ID_EX_ALUOp)
    );

     ProcessadorPipeline dut (
        .clk(clk1),
        .clk_ROM(clk2),
        .rst(rst)
    );

    

    // Geracaoo do clk1 (periodo = 10 unidades de tempo)
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

        rst = 1;                
    $display("Resetando: ");
        #10;
        rst = 0;                
    #10;

        $display("Ler primeira Instruço: o");
        #20;


        // Finaliza a simulação
        $finish;
    end

    // Monitoramento dos sinais
    initial begin
        $monitor("Time=%0t | rst=%b - IF_STAGE: IF_ID_PC=%d | IF_ID_Instruction=%b - ID_STAGE: IF_ID_PC4=%d | IF_ID_Instruction1=%b | ID_EX_ReadData1=%b | ID_EX_SignExtImm=%b | ID_EX_Rd=%b | ID_EX_Rb=%b | ID_EX_PC=%b",
                $time, rst, IF_ID_PC, IF_ID_Instruction, IF_ID_PC4, IF_ID_Instruction1, ID_EX_ReadData1, ID_EX_SignExtImm, ID_EX_Rd, ID_EX_Rb, ID_EX_PC);
    end

endmodule