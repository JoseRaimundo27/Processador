module ALUControl(
    input [3:0] ALUOp,       // Opcode ou sinal de controle
    output reg [3:0] ALUControl // Sinal para controlar a ALU
);

// Parametros para operaçoes da ALU
parameter ADD = 5'b00110;
parameter SUB = 5'b00111;
parameter MUL = 5'b01000;
parameter DIV = 5'b01001;
parameter AND = 5'b01010;
parameter OR = 5'b01011;
parameter SHL = 5'b01100;
parameter SHR = 5'b01101;
parameter CMP = 5'b01110;
parameter NOT = 5'b01111;

// Lógica combinacional para gerar o ALUControl
always @(*) begin
    case(ALUOp)
        5'b00110: ALUControl = ADD; // Adiçao
        5'b00111: ALUControl = SUB; // Subtraçao
        5'b01000: ALUControl = MUL; // Multiplicaçao
        5'b01001: ALUControl = DIV; // Operaçao logica DIV
        5'b01010: ALUControl = AND;  // Operaçao logica AND
        5'b01011: ALUControl = OR; // Operacao Logica OR
        5'b01100: ALUControl = SHL; // Shift left logico
        5'b01101: ALUControl = SHR; // Shift right logico
        5'b01110: ALUControl = CMP; // Operaçao lógica CMP
        5'b01111: ALUControl = NOT; // Operacao logica NOT
        default: ALUControl = 5'b11111; // Indefinido para códigos inválidos (NOP)
    endcase
end

endmodule
