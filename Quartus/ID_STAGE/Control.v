module Control (
    input wire clk,                  
    input wire [4:0] opcode,         // Campo opcode da instrução (bits [31:26])
  
    output reg RegDst,               // Escolha do registrador destino
    output reg ALUSrc,               // Fonte do segundo operando da ALU
    output reg MemToReg,             // Controle para gravar na memória
    output reg RegWrite,             // Habilitação de escrita no registrador
    output reg MemRead,              // Habilitação de leitura da memória
    output reg MemWrite,             // Habilitação de escrita na memória
    output reg Branch,               // Controle de branch
    output reg [4:0] ALUOp           // Controle da operação da ALU
);


// Definição de opcodes (instruções)
parameter LW_1  = 5'b00000,  // Load Word - Estado 1
			 LW_2  = 5'b00001,  // Load Word - Estado 2
			 LW_3  = 5'b00010,  // Load Word - Estado 3
			 SW_1  = 5'b00011,  // Store Word - Estado 1
			 SW_2  = 5'b00100,  // Store Word - Estado 2
			 MOV   = 5'b00101,  // Move
			 ADD   = 5'b00110,  // Add
			 SUB   = 5'b00111,  // Subtract
			 MUL   = 5'b01000,  // Multiply
			 DIV   = 5'b01001,  // Divide
			 AND   = 5'b01010,  // AND
			 OR    = 5'b01011,  // OR
			 SHL   = 5'b01100,  // Shift Left
			 SHR   = 5'b01101,  // Shift Right
			 CMP   = 5'b01110,  // Compare
			 NOT   = 5'b01111,  // NOT
			 JR    = 5'b10000,  // Jump Register
			 JPC   = 5'b10001,  // Jump on Condition
			 BRFL  = 5'b10010,  // Branch Flag
			 CALL  = 5'b10011,  // Call
			 RET   = 5'b10100,  // Return
			 NOP   = 5'b10101;  // No Operation

always @(posedge clk) begin
    case (opcode)
        LW_1: begin
            RegDst <= 0;
            ALUSrc <= 1;
            MemToReg <= 1;
            RegWrite <= 1;
            MemRead <= 1;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= LW_1;
        end
         LW_2: begin
            RegDst <= 0;
            ALUSrc <= 0;
            MemToReg <= 1;
            RegWrite <= 1;
            MemRead <= 1;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= LW_2; 
        end
        LW_3: begin
            RegDst <= 0;
            ALUSrc <= 1;
            MemToReg <= 1;
            RegWrite <= 1;
            MemRead <= 1;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= LW_3; 
        end
        SW_1: begin
           	RegDst <= 'bx;
            ALUSrc <= 1;
            MemToReg <= 'bx;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 1;
            Branch <= 0;
            ALUOp <= SW_1;
        end
        SW_2: begin
            RegDst <= 'bx;
            ALUSrc <= 0;
            MemToReg <= 'bx;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 1;
            Branch <= 0;
            ALUOp <= SW_2;
        end
        MOV: begin
            RegDst <= 1;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= MOV;
        end
        ADD: begin
            RegDst <= 1;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= ADD;
        end
        SUB: begin
            RegDst <= 1;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= SUB;
        end
        MUL: begin
            RegDst <= 1;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= MUL;
        end
        DIV: begin
            RegDst <= 1;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= DIV;
        end
        AND: begin
            RegDst <= 1;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= AND;
        end
        OR: begin
            RegDst <= 1;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= OR;
        end
        SHL: begin
            RegDst <= 1;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= SHL;
        end
        SHR: begin
            RegDst <= 1;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= SHR;
        end
        CMP: begin
            RegDst <= 1;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= CMP;
        end
        NOT: begin
            RegDst <= 1;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= NOT;
        end
        JR: begin
            RegDst <= 0;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 1;
            ALUOp <= JR;
        end
        JPC: begin
            RegDst <= 0;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 1;
            ALUOp <= JPC;
        end
        BRFL: begin
            RegDst <= 0;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 1;
            ALUOp <= BRFL;
        end
        CALL: begin
            RegDst <= 0;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 1;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 1;
            ALUOp <= CALL;
        end
        RET: begin
            RegDst <= 0;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 1;
            ALUOp <= RET;
        end
        NOP: begin
            RegDst <= 0;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
            ALUOp <= NOP;
        end
        default: begin
            RegDst <= 0;
            ALUSrc <= 0;
            MemToReg <= 0;
            RegWrite <= 0;
            MemRead <= 0;
            MemWrite <= 0;
            Branch <= 0;
          	ALUOp <= 5'b11111; //colocar um endereço default
        end
    endcase
end

endmodule
