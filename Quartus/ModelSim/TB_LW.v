module TB_LW;

    // Declaracao dos sinais de teste
    reg clk1;                      // Clock principal
    reg clk2;                      // Clock da memória de instrução
    reg rst;                       // Reset
    reg BranchTaken;               // Sinal de branch
    reg [7:0] BranchTarget;       // Endereço de destino do branch
    wire [31:0] IF_ID_Instruction; // Instrução de saída
    wire [7:0] IF_ID_PC;          // Contador de programa (PC)
    // NAO FAZ SENTIDO -> wire [31:0] IF_ID_Instruction1; // Instrução de saída
    // NAO FAZ SENTIDO -> wire [7:0] IF_ID_PC4;          // Contador de programa (PC)
    wire [31:0] ID_EX_ReadData1;   // Conteudo do Reg1
    wire [31:0] ID_EX_SignExtImm;   // Conteudo do Sinal Extendido
    wire [4:0] ID_EX_Rd;   // Endereco do Reg Destino
    wire [4:0] ID_EX_Rb;   // Endereco do RegBase
    wire [7:0] ID_EX_PC;          // Contador de programa (PC) ID_EX
    wire ID_EX_RegDst, ID_EX_ALUSrc, ID_EX_MemToReg, ID_EX_RegWrite, ID_EX_MemRead, ID_EX_MemWrite, ID_EX_Branch;
    wire [4:0] ID_EX_ALUOp;
    wire [31:0] EX_MEM_ALUResult, EX_MEM_WriteData;
    wire [4:0] EX_MEM_WriteReg;
    wire EX_MEM_MemWriteOut, EX_MEM_MemtoRegOut, EX_MEM_RegWrite, EX_MEM_MemReadOut, EX_MEM_Branch;
    wire [7:0] EX_MEM_BranchTarget;

    wire [31:0] MEM_WB_ALUResult, MEM_WB_ReadData;
    wire [4:0] MEM_WB_WriteReg;
    wire MEM_WB_MemToReg,MEM_WB_RegWrite;

    wire [31:0] WriteData;
    wire [4:0] WriteRegOut;
    wire RegWriteOut;



      ProcessadorPipeline dut (
        .clk(clk1),
        .clk_ROM(clk2),
        .rst(rst)
    );

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

    EX_STAGE dut_EX_STAGE(
        .clk(clk1),
        .rst(rst),
        .ID_EX_ReadData1(ID_EX_ReadData1),
        .ID_EX_ReadData2(ID_EX_ReadData2),
        .ID_EX_SignExtImm(ID_EX_SignExtImm),
        .ID_EX_Rb(ID_EX_Rb),
        .ID_EX_Rd(ID_EX_Rd),
        .ID_EX_PC(ID_EX_PC),
        .ID_EX_RegDst(ID_EX_RegDst),
        .ID_EX_ALUSrc(ID_EX_ALUSrc),
        .ID_EX_MemtoReg(ID_EX_MemToReg),
        .ID_EX_RegWrite(ID_EX_RegWrite),
        .ID_EX_MemRead(ID_EX_MemRead),
        .ID_EX_MemWrite(ID_EX_MemWrite),
        .ID_EX_Branch(ID_EX_Branch),
        .ID_EX_ALUOp(ID_EX_ALUOp),

        .EX_MEM_ALUResult(EX_MEM_ALUResult),
        .EX_MEM_WriteData(EX_MEM_WriteData),
        .EX_MEM_MemWriteOut(EX_MEM_MemWriteOut),
        .EX_MEM_WriteReg(EX_MEM_WriteReg),
        .EX_MEM_MemtoRegOut(EX_MEM_MemtoRegOut),
        .EX_MEM_RegWrite(EX_MEM_RegWrite),
        .EX_MEM_MemReadOut(EX_MEM_MemReadOut),
        .EX_MEM_Branch(EX_MEM_Branch),
        .EX_MEM_BranchTarget(EX_MEM_BranchTarget)

    );

    MEM_STAGE dut_MEM_STAGE(
        .clk(clk),
        .rst(rst),
        
        .EX_MEM_ALUResult(EX_MEM_ALUResult),
        .EX_MEM_Data(EX_MEM_WriteData),
        .EX_MEM_MemWrite(EX_MEM_MemWriteOut),
        .EX_MEM_WriteReg(EX_MEM_WriteReg),
        .EX_MEM_MemToReg(EX_MEM_MemtoRegOut),
        .EX_MEM_RegWrite(EX_MEM_RegWrite),
        .EX_MEM_MemRead(EX_MEM_MemReadOut),
        
        .MEM_WB_ALUResult(MEM_WB_ALUResult),
        .MEM_WB_ReadData(MEM_WB_ReadData),
        .MEM_WB_WriteReg(MEM_WB_WriteReg),
        .MEM_WB_MemToReg(MEM_WB_MemToReg),
	    .MEM_WB_RegWrite(MEM_WB_RegWrite)
	    
	    
    );

    WB_Stage dut_WB_Stage(
        .ALUResult(MEM_WB_ALUResult),
        .MemData(MEM_WB_ReadData),
        .WriteReg(MEM_WB_WriteReg),
        .MemToReg(MEM_WB_MemToReg),
        .RegWrite(MEM_WB_RegWrite),

        .WriteData(WriteData),
        .WriteRegOut(WriteRegOut),
        .RegWriteOut(RegWriteOut)
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
        rst = 0;
        #10
        rst = 1;
        # 5
        rst = 0;
                
        $display("Resetando: ");
        #10;
        rst = 0;                
        #10;

        $display("Ler primeira Instrução:");
        #10;
        #10;

        // Finaliza a simulação
        $finish;
    end

    // Monitoramento dos sinais a cada 5 unidades de tempo
    // Monitoramento dos sinais a cada 5 unidades de tempo, alinhado ao tempo de simulação
	initial begin
    	#5; // Aguarda o primeiro ciclo de 5 unidades de tempo para alinhar
    	forever begin
        	$display("Time=%0t | rst=%b\nIF_STAGE: IF_ID_PC=%d | IF_ID_Instruction=%b \nID_STAGE: IF_ID_PC=%d | IF_ID_Instruction=%b \nID_EX_ReadData1=%b | ID_EX_SignExtImm=%b | ID_EX_Rd=%b | ID_EX_Rb=%b | ID_EX_PC=%b \nEX_STAGE: EX_MEM_ALUResult=%b | EX_MEM_WriteData=%b | EX_MEM_Branch=%b | EX_MEM_BranchTarget=%b \nMEM_STAGE: MEM_WB_ALUResult=%b | MEM_WB_ReadData=%b | MEM_WB_WriteReg=%b \nWB_STAGE: WriteData=%b | WriteRegOut=%b",
            $time, rst, 
            IF_ID_PC, IF_ID_Instruction, 
            IF_ID_PC, IF_ID_Instruction, 
            ID_EX_ReadData1, ID_EX_SignExtImm, ID_EX_Rd, ID_EX_Rb, ID_EX_PC,
            EX_MEM_ALUResult, EX_MEM_WriteData, EX_MEM_Branch, EX_MEM_BranchTarget, MEM_WB_ALUResult, MEM_WB_ReadData, MEM_WB_WriteReg,WriteData, WriteRegOut
        );

       	 #5; // Espera 5 unidades de tempo antes de imprimir novamente
    end
end


endmodule
