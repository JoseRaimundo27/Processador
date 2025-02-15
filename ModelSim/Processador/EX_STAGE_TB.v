module EX_STAGE_TB;
    // Inputs
    reg clk, rst;
    reg [4:0] ID_EX_ALUOp;
    reg [31:0] ID_EX_ReadData1, ID_EX_ReadData2, ID_EX_SignExtImm;
    reg ID_EX_ALUSrc, ID_EX_RegWrite, ID_EX_MemtoReg;
    reg ID_EX_MemWrite, ID_EX_MemRead, ID_EX_Branch;
    reg [4:0] ID_EX_Rd;
    reg [7:0] ID_EX_PC;
    
    // Outputs
    wire EX_MEM_MemtoRegOut, EX_MEM_MemWriteOut, EX_MEM_MemReadOut;
    wire EX_MEM_Branch;
    wire [7:0] EX_MEM_BranchTarget;
    wire [31:0] EX_MEM_WriteData, EX_MEM_ALUResult;
    wire [4:0] EX_MEM_WriteReg;
    wire EX_MEM_RegWrite;

    // Unit Under Test (UUT)
    EX_STAGE uut (
        .ID_EX_ALUSrc(ID_EX_ALUSrc),
        .rst(rst),
        .clk(clk),
        .ID_EX_RegWrite(ID_EX_RegWrite),
        .ID_EX_MemtoReg(ID_EX_MemtoReg),
        .ID_EX_MemWrite(ID_EX_MemWrite),
        .ID_EX_MemRead(ID_EX_MemRead),
        .ID_EX_Branch(ID_EX_Branch),
        .ID_EX_ALUOp(ID_EX_ALUOp),
        .ID_EX_PC(ID_EX_PC),
        .ID_EX_Rd(ID_EX_Rd),
        .ID_EX_ReadData1(ID_EX_ReadData1),
        .ID_EX_ReadData2(ID_EX_ReadData2),
        .ID_EX_SignExtImm(ID_EX_SignExtImm),
        .EX_MEM_MemtoRegOut(EX_MEM_MemtoRegOut),
        .EX_MEM_MemWriteOut(EX_MEM_MemWriteOut),
        .EX_MEM_MemReadOut(EX_MEM_MemReadOut),
        .EX_MEM_Branch(EX_MEM_Branch),
        .EX_MEM_RegWrite(EX_MEM_RegWrite),
        .EX_MEM_ALUResult(EX_MEM_ALUResult),
        .EX_MEM_BranchTarget(EX_MEM_BranchTarget),
        .EX_MEM_WriteData(EX_MEM_WriteData),
        .EX_MEM_WriteReg(EX_MEM_WriteReg)
    );

    // Gerador de Clock
    initial begin
        clk = 1;
        forever #5 clk = ~clk; // Toggle a cada 5 unidades de tempo
    end

    initial begin
        // Inicializa Inputs
        rst = 1;
        ID_EX_ALUOp = 5'b00000;
        ID_EX_ReadData1 = 32'b0;
        ID_EX_ReadData2 = 32'b0;
        ID_EX_SignExtImm = 32'b0;
        ID_EX_ALUSrc = 0;
        ID_EX_PC = 8'b0;
        ID_EX_RegWrite = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_MemWrite = 0;
        ID_EX_MemRead = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b00000;

        // Sinal de Reset       
        #10;
        rst = 0;

        #10;
        // Teste LW_1 (Load Word com Endereçamento Base-Deslocamento)
        ID_EX_ALUSrc = 1;
        ID_EX_MemtoReg = 1;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 1;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b00001;
        ID_EX_ALUOp = 5'b00000;   // LW_1 15($4), $2 
        ID_EX_ReadData1 = 32'd28; // ($4)
        ID_EX_ReadData2 = 32'd8;  // ($2)
        ID_EX_SignExtImm = 32'd15;
        #10;

        // Teste LW_2 (Load Word com Endereçamento Direto)
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 1;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 1;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b00010;
        ID_EX_ALUOp = 5'b00001; // LW_2 $3, $7
        ID_EX_ReadData1 = 32'd44; // ($3)
        ID_EX_ReadData2 = 32'd2;  // ($7)
        ID_EX_SignExtImm = 32'b0; 
        #10;

        // Teste LW_3 (Load Word com Endereçamento Imediato)
        ID_EX_ALUSrc = 1;
        ID_EX_MemtoReg = 1;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 1;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b00011;
        ID_EX_ALUOp = 5'b00010; // LW_3
        ID_EX_ReadData1 = 32'd0;
        ID_EX_ReadData2 = 32'd10;
        ID_EX_SignExtImm = 32'd17;
        #10;

        // Teste SW_1 (Store Word com Endereçamento Imediato)
        ID_EX_ALUSrc = 1;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 0;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 1;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b00100;
        ID_EX_ALUOp = 5'b00011; // SW_1
        ID_EX_ReadData1 = 32'd0;
        ID_EX_ReadData2 = 32'd3;
        ID_EX_SignExtImm = 32'd10;
        #10;

        // Teste SW_2 (Store Word com Endereçamento Direto)
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 0;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 1;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b00100;
        ID_EX_ALUOp = 5'b00101; // SW_2
        ID_EX_ReadData1 = 32'd10;
        ID_EX_ReadData2 = 32'd10;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste MOV
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b00110;
        ID_EX_ALUOp = 5'b00101; // MOV
        ID_EX_ReadData1 = 32'd22;
        ID_EX_ReadData2 = 32'd0;
        ID_EX_SignExtImm = 32'd0;
        #10

        // Teste ADD
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b00111;
        ID_EX_ALUOp = 5'b00110; // ADD
        ID_EX_ReadData1 = 32'd10;
        ID_EX_ReadData2 = 32'd5;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste SUB
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b01000;
        ID_EX_ALUOp = 5'b00111; // SUB
        ID_EX_ReadData1 = 32'd10;
        ID_EX_ReadData2 = 32'd5;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste MUL
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b01001;
        ID_EX_ALUOp = 5'b01000; // MUL
        ID_EX_ReadData1 = 32'd10;
        ID_EX_ReadData2 = 32'd5;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste DIV
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b01010;
        ID_EX_ALUOp = 5'b01001; // DIV
        ID_EX_ReadData1 = 32'd10;
        ID_EX_ReadData2 = 32'd5;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste AND
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b01011;
        ID_EX_ALUOp = 5'b01010; // AND
        ID_EX_ReadData1 = 32'd1;
        ID_EX_ReadData2 = 32'd1;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste OR
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b01100;
        ID_EX_ALUOp = 5'b01011; // OR
        ID_EX_ReadData1 = 32'd1;
        ID_EX_ReadData2 = 32'd0;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste SHL
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b01101;
        ID_EX_ALUOp = 5'b01100; // SHL
        ID_EX_ReadData1 = 32'd15;
        ID_EX_ReadData2 = 32'd3;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste SHR
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b01110;
        ID_EX_ALUOp = 5'b01101; // SHR
        ID_EX_ReadData1 = 32'd15;
        ID_EX_ReadData2 = 32'd3;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste CMP
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 0;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b01111;
        ID_EX_ALUOp = 5'b01110; // CMP
        ID_EX_ReadData1 = 32'd15;
        ID_EX_ReadData2 = 32'd15;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste NOT
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_Rd = 5'b10000;
        ID_EX_ALUOp = 5'b01111; // NOT
        ID_EX_ReadData1 = 32'd0;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste JR
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 0;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 1;
        ID_EX_Rd = 5'b10001;
        ID_EX_ALUOp = 5'b10000; // JR
        ID_EX_ReadData1 = 32'd10;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste JPC
        ID_EX_ALUSrc = 1;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 0;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_PC = 8'b00010000;
        ID_EX_Branch = 1;
        ID_EX_Rd = 5'b10010;
        ID_EX_ALUOp = 5'b10001; // JPC
        ID_EX_ReadData2 = 32'd5;
        ID_EX_SignExtImm = 32'd8;

        #10;

        // Teste BRFL
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 0;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 1;
        ID_EX_Rd = 5'b10011;
        ID_EX_ALUOp = 5'b10010; // BRFL
        ID_EX_ReadData1 = 32'd20;
        ID_EX_ReadData2 = 5'b00001; // Máscara para Flag Igual
        ID_EX_SignExtImm = 32'b0;
        #10;

        // Teste CALL
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 1;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 1;
        ID_EX_Rd = 5'b10100;
        ID_EX_ALUOp = 5'b10011; // CALL
        ID_EX_ReadData1 = 32'd10;
        ID_EX_SignExtImm = 32'b0;
        #10;

        // Teste RET
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 0;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 1;
        ID_EX_Rd = 5'b10101;
        ID_EX_ALUOp = 5'b10100; // RET
        ID_EX_ReadData2 = 32'd31;
        ID_EX_SignExtImm = 32'd0;
        #10;

        // Teste NOP
        ID_EX_ALUSrc = 0;
        ID_EX_MemtoReg = 0;
        ID_EX_RegWrite = 0;
        ID_EX_MemRead = 0;
        ID_EX_MemWrite = 0;
        ID_EX_Branch = 0;
        ID_EX_ALUOp = 5'b10101; // NOP
        #10;

        // End simulation
        $stop;
    end

    initial begin
    	
        forever begin
            // Amostra de Resultados
            $display("\nTime=%0t | rst=%b",
                    $time, rst);
            $display("ID_STAGE: ALUSrc =%b | MemToReg =%b | RegWrite =%b | MemRead =%b | MemWrite =%b | Branch =%b | ALUOp=%b | ReadData1=%d | ReadData2=%d | PC=%d",
                    ID_EX_ALUSrc, ID_EX_MemtoReg, ID_EX_RegWrite, ID_EX_MemRead, ID_EX_MemWrite, ID_EX_Branch, ID_EX_ALUOp, ID_EX_ReadData1, ID_EX_ReadData2, ID_EX_PC);
            $display("EX_STAGE: ALUResult=%d | WriteData=%d | MemWrite=%b | MemRead=%b | WriteReg=%b | MemtoReg=%b | RegWrite=%b | Branch=%b | BranchTarget=%d",
                    EX_MEM_ALUResult, EX_MEM_WriteData, EX_MEM_MemWriteOut, EX_MEM_MemReadOut, EX_MEM_WriteReg, EX_MEM_MemtoRegOut, EX_MEM_RegWrite, EX_MEM_Branch, EX_MEM_BranchTarget);
            #5;
        end
    end
endmodule