
module MEM_Stage_TB;

    reg clk;
    reg rst;
    reg [31:0] EX_MEM_ALUResult;
    reg [31:0] EX_MEM_ReadData2;
    reg [4:0] EX_MEM_WriteReg;
    reg EX_MEM_MemRead;
    reg EX_MEM_MemWrite;
    reg EX_MEM_MemToReg;
    reg EX_MEM_RegWrite;
    wire [31:0] MEM_WB_ALUResult;
    wire [31:0] MEM_WB_ReadData;
    wire [4:0] MEM_WB_WriteReg;
    wire MEM_WB_MemToReg;
    wire MEM_WB_RegWrite;

    // Instancia o módulo MEM_Stage
    MEM_Stage uut (
        .clk(clk),
        .rst(rst),
        .EX_MEM_ALUResult(EX_MEM_ALUResult),
        .EX_MEM_ReadData2(EX_MEM_ReadData2),
        .EX_MEM_WriteReg(EX_MEM_WriteReg),
        .EX_MEM_MemRead(EX_MEM_MemRead),
        .EX_MEM_MemWrite(EX_MEM_MemWrite),
        .EX_MEM_MemToReg(EX_MEM_MemToReg),
        .EX_MEM_RegWrite(EX_MEM_RegWrite),
        .MEM_WB_ALUResult(MEM_WB_ALUResult),
        .MEM_WB_ReadData(MEM_WB_ReadData),
        .MEM_WB_WriteReg(MEM_WB_WriteReg),
        .MEM_WB_MemToReg(MEM_WB_MemToReg),
        .MEM_WB_RegWrite(MEM_WB_RegWrite)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Testbench logic
    initial begin
        $display("Starting Testbench for MEM_Stage");

        // Reset the system
        rst = 1;
        #10;
        rst = 0;

        // Test case 1: Write to memory
        EX_MEM_ALUResult = 32'h00000010;
        EX_MEM_ReadData2 = 32'hABCD1234;
        EX_MEM_WriteReg = 5'd3;
        EX_MEM_MemRead = 0;
        EX_MEM_MemWrite = 1;
        EX_MEM_MemToReg = 0;
        EX_MEM_RegWrite = 0;

        #10;
        $display("Test 1: Write to memory");
        $display("MEM_WB_ALUResult = %h", MEM_WB_ALUResult);
        $display("MEM_WB_ReadData = %h", MEM_WB_ReadData);
        $display("MEM_WB_WriteReg = %d", MEM_WB_WriteReg);
        $display("MEM_WB_MemToReg = %b", MEM_WB_MemToReg);
        $display("MEM_WB_RegWrite = %b", MEM_WB_RegWrite);

        // Test case 2: Read from memory
        EX_MEM_ALUResult = 32'h00000010;
        EX_MEM_ReadData2 = 32'h00000000;
        EX_MEM_WriteReg = 5'd3;
        EX_MEM_MemRead = 1;
        EX_MEM_MemWrite = 0;
        EX_MEM_MemToReg = 1;
        EX_MEM_RegWrite = 1;

        #10;
        $display("Test 2: Read from memory");
        $display("MEM_WB_ALUResult = %h", MEM_WB_ALUResult);
        $display("MEM_WB_ReadData = %h", MEM_WB_ReadData);
        $display("MEM_WB_WriteReg = %d", MEM_WB_WriteReg);
        $display("MEM_WB_MemToReg = %b", MEM_WB_MemToReg);
        $display("MEM_WB_RegWrite = %b", MEM_WB_RegWrite);

        // End of test
        $display("Testbench completed");
        $stop;
    end

endmodule
