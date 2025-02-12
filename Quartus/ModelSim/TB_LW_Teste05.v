module TB_LW_Teste05;

    // Declaracao dos sinais de teste
    reg clk;                      // Clock principal
    reg rst;
    reg EX_MEM_MemWrite;
    reg EX_MEM_MemToReg;
    reg EX_MEM_RegWrite;
    reg EX_MEM_MemRead;
    reg [31:0] EX_MEM_ALUResult;
    reg [31:0] EX_MEM_Data;
    reg [4:0] EX_MEM_WriteReg;
    wire MEM_WB_MemToReg;
    wire MEM_WB_RegWrite;
    wire [31:0] MEM_WB_ALUResult;
    wire [31:0] MEM_WB_ReadData;
    wire [4:0] MEM_WB_WriteReg;    

    ProcessadorPipeline_MEM uut (
      .EX_MEM_MemWrite(EX_MEM_MemWrite),
      .EX_MEM_MemToReg(EX_MEM_MemToReg),
      .EX_MEM_RegWrite(EX_MEM_RegWrite),
      .EX_MEM_MemRead(EX_MEM_MemRead),
      .clk(clk),
      .rst(rst),
      .EX_MEM_ALUResult(EX_MEM_ALUResult),
      .EX_MEM_Data(EX_MEM_Data),
      .EX_MEM_WriteReg(EX_MEM_WriteReg),
      .MEM_WB_MemToReg(MEM_WB_MemToReg),
      .MEM_WB_RegWrite(MEM_WB_RegWrite),
      .MEM_WB_ALUResult(MEM_WB_ALUResult),
      .MEM_WB_ReadData(MEM_WB_ReadData),
      .MEM_WB_WriteReg(MEM_WB_WriteReg)
    );

    // Geracao do clk1 (periodo = 10 unidades de tempo)
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // Toggle a cada 5 unidades de tempo
    end

    // Estímulos de teste
    initial begin
        EX_MEM_MemToReg = 1;
        EX_MEM_RegWrite = 1;
        EX_MEM_MemRead = 1;
        EX_MEM_ALUResult = 32'd20;
        EX_MEM_Data = 32'd20;
        EX_MEM_WriteReg = 5'd10;

        rst = 1;
        $display("Resetando: ");
        #10;
      
        rst = 0;       
        #20;

        // Finaliza a simulação
        $finish;
    end

    // Monitoramento dos sinais a cada 5 unidades de tempo, alinhado ao tempo de simulação
    initial begin
        forever begin
            $display("\nTime=%0t | rst=%b",
                    $time, rst);
            $display("EX_STAGE: EX_MEM_ALUResult=%d | EX_MEM_Data=%d | EX_MEM_MemWrite=%b | EX_MEM_MemRead=%b",
                    EX_MEM_ALUResult, EX_MEM_Data, EX_MEM_MemWrite, EX_MEM_MemRead);
            $display("MEM_STAGE: MEM_WB_ALUResult=%d | MEM_WB_ReadData=%d | MEM_WB_MemToReg=%b | MEM_WB_RegWrite=%b",
                    MEM_WB_ALUResult, MEM_WB_ReadData, MEM_WB_MemToReg, MEM_WB_RegWrite);
            #5; // Espera 5 unidades de tempo antes de imprimir novamente
        end
    end

endmodule
