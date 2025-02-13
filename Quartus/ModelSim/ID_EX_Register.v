module ID_EX_Register (
    input wire clk,
    input wire rst,                   
	 input wire [7:0] inPc,
    input wire [31:0] inReadData1,        // Dados lidos do registrador 1
    input wire [31:0] inReadData2,        // Dados lidos do registrador 2
    input wire [31:0] inSignExtImm,       // Imediato estendido
    input wire [4:0] inRb,                // Registrador base (Rb)
    input wire [4:0] inRd,                // Registrador destino (Rd)
  
    input wire inRegDst,                  // Controle RegDst
    input wire inALUSrc,                  // Controle ALUSrc
    input wire inMemToReg,                // Controle MemToReg
    input wire inRegWrite,                // Controle RegWrite
    input wire inMemRead,                 // Controle MemRead
    input wire inMemWrite,                // Controle MemWrite
    input wire inBranch,                  // Controle Branch
  	 input wire [4:0] inALUOp,             // Controle ALUOp
    
    output reg [31:0] outReadData1,       // Dados para estágio EX (registrador 1)
    output reg [31:0] outReadData2,       // Dados para estágio EX (registrador 2)
    output reg [31:0] outSignExtImm,      // Imediato estendido para estágio EX
    output reg [4:0] outRd,               // Rd para estágio EX
  	 output reg [7:0] outPc,
  
    output reg outALUSrc,                 // Controle ALUSrc para estágio EX
    output reg outMemToReg,               // Controle MemToReg para estágio EX
    output reg outRegWrite,               // Controle RegWrite para estágio EX
    output reg outMemRead,                // Controle MemRead para estágio EX
    output reg outMemWrite,               // Controle MemWrite para estágio EX
    output reg outBranch,                 // Controle Branch para estágio EX
  	 output reg [4:0] outALUOp             // Controle ALUOp para estágio EX
);

  always @(posedge clk) begin
        if (rst) begin
            outReadData1 <= 32'b0;
            outReadData2 <= 32'b0;
            outSignExtImm <= 32'b0;
            outRd <= 5'b0;
          	outPc <= 8'b0;
            outALUSrc <= 1'b0; //Controle
            outMemToReg <= 1'b0; //Controle
            outRegWrite <= 1'b0; //Controle
            outMemRead <= 1'b0; //Controle
            outMemWrite <= 1'b0; //Controle
            outBranch <= 1'b0; //Controle
            outALUOp <= 5'b11111; //Controle
        end else begin
            outReadData1 <= inReadData1;
            outReadData2 <= inReadData2;
            outSignExtImm <= inSignExtImm;
            outRd <= inRd;
          	outPc <= inPc;
            outALUSrc <= inALUSrc; //Controle
            outMemToReg <= inMemToReg; //Controle
            outRegWrite <= inRegWrite; //Controle
            outMemRead <= inMemRead; //Controle
            outMemWrite <= inMemWrite; //Controle
            outBranch <= inBranch;  //Controle
            outALUOp <= inALUOp; //Controle
        end
    end

endmodule
