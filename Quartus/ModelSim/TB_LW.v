module TB_LW;

    // Declaracao dos sinais de teste
    reg clk1;                      // Clock principal
    reg clk2;                      // Clock da memória de instrução
    reg rst;                       // Reset
    wire [31:0] IF_ID_Instruction; // Instrução de saída
    wire [7:0] IF_ID_PC;          // Contador de programa (PC)
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
    wire [31:0] MEM_WB_ALUResult;
  	wire [31:0] MEM_WB_ReadData;
    wire [4:0] MEM_WB_WriteReg;
    wire MEM_WB_MemToReg;
  	wire MEM_WB_RegWrite;
    wire [31:0] WriteData;
    wire [4:0] WriteRegOut;
    wire RegWriteOut;
  	wire WB_RegWrite;
  	wire [4:0] WB_writeReg;
  	wire [31:0] WB_writeData;
    wire [31:0] ID_EX_ReadData2;



    ProcessadorPipeline dut (
        .clk_ROM(clk2),
        .clk_RAM(clk2),
      	.clk_Reg(clk2),
      	.clk(clk1),
        .rst(rst)
    );

    // Instanciacaoo do modulo IF_Stage
    IF_STAGE dut_IF_STAGE (
        .clk(clk1),
        .rst(rst),
        .BranchTaken(EX_MEM_Branch),
        .clk_ROM(clk2),
        .BranchTarget(EX_MEM_BranchTarget),
        .IF_ID_Instruction(IF_ID_Instruction),
        .IF_ID_PC(IF_ID_PC)
    );

    // Instanciando o modulo ID_Stage
    ID_STAGE dut_ID_STAGE (
        .clk(clk1),
      	.clk_Reg(clk2),
        .rst(rst),
        .IF_ID_PC(IF_ID_PC),
        .IF_ID_Instruction(IF_ID_Instruction),
        .RegWrite(RegWriteOut),
        .writeReg(WriteRegOut),
        .writeData(WriteData),
        .ID_EX_ReadData1(ID_EX_ReadData1),
        .ID_EX_ReadData2(ID_EX_ReadData2),
        .ID_EX_SignExtImm(ID_EX_SignExtImm),
        .ID_EX_Rd(ID_EX_Rd),
        .ID_EX_PC(ID_EX_PC),
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
        .ID_EX_Rd(ID_EX_Rd),
        .ID_EX_PC(ID_EX_PC),
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
      	.clk(clk1),
        .clk_RAM(clk2),
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

    // Geracao do clk1 (periodo = 10 unidades de tempo)
    initial begin
        clk1 = 0;
        forever #5 clk1 = ~clk1; // Toggle a cada 5 unidades de tempo
    end

    // Geracao do clk2 (período = 5 unidades de tempo)
    initial begin
        clk2 = 0;
        forever #2.5 clk2 = ~clk2; // Toggle a cada 2.5 unidades de tempo
    end

    // Estímulos de teste
    initial begin
        rst = 1;
      	$display("Resetando:");
        #10
      
        rst = 0;       
        #10;

        $display("Ler primeira Instrucao:");
        #15;
      
      	$display("Executar primeira Instrucao:");
      
      	#15;
      
        $display("Ler memoria:");
        #95;

        // Finaliza a simulação
        $finish;
    end

    // Monitoramento dos sinais a cada 5 unidades de tempo, alinhado ao tempo de simulação
	initial begin
    	//#5; // Aguarda o primeiro ciclo de 5 unidades de tempo para alinhar
    	forever begin
            $display("\nTime=%0t | rst=%b",
                    $time, rst);
            $display("IF_STAGE: BranchTaken=%b | BranchTarget=%d | IF_ID_PC=%d | IF_ID_Instruction=%b",
                    EX_MEM_Branch, EX_MEM_BranchTarget, IF_ID_PC, IF_ID_Instruction);
            $display("ID_STAGE: ID_EX_ReadData1=%d | ID_EX_ReadData2=%d | ID_EX_SignExtImm=%d | ID_EX_Rd=%b | ID_EX_Rb=%b | ID_EX_PC=%d | ID_EX_Branch=%b | RegDst=%b | MemToReg=%b | RegWrite=%b | MemRead=%b | ALUOp=%b",
                    ID_EX_ReadData1, ID_EX_ReadData2, ID_EX_SignExtImm, ID_EX_Rd, ID_EX_Rb, ID_EX_PC, ID_EX_Branch, ID_EX_RegDst, ID_EX_MemToReg, ID_EX_RegWrite, ID_EX_MemRead, ID_EX_ALUOp);
            $display("EX_STAGE: WriteReg=%b | EX_MEM_ALUResult=%d | EX_MEM_WriteData=%d | EX_MEM_Branch=%b | EX_MEM_BranchTarget=%d | MemRead=%b | ALUSrc=%b | MemToReg=%b",
                    EX_MEM_WriteReg, EX_MEM_ALUResult, EX_MEM_WriteData, EX_MEM_Branch, EX_MEM_BranchTarget, EX_MEM_MemReadOut, ID_EX_ALUSrc, EX_MEM_MemtoRegOut);          
            $display("MEM_STAGE: MEM_WB_ALUResult=%d | MEM_WB_ReadData=%d | MEM_WB_WriteReg=%b | MemToReg=%b | RegWrite=%b",
          		    MEM_WB_ALUResult, MEM_WB_ReadData, MEM_WB_WriteReg, MEM_WB_MemToReg, MEM_WB_RegWrite);
            $display("WB_STAGE: WriteData=%d | WriteReg=%b | RegWrite=%b",
          		    WriteData, WriteRegOut, RegWriteOut);

       	#5; // Espera 5 unidades de tempo antes de imprimir novamente
    end
end

endmodule
