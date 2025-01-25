module Mux2to1 (
    input [31:0] in0,       // Primeira entrada do multiplexador (registrador fonte)
    input [31:0] in1,       // Segunda entrada do multiplexador (imediato estendido)
    input select,           // Sinal de seleção (ALUSrc)
    output reg [31:0] out   // Saída do multiplexador (entrada da ALU)
);

    always @(*) begin
        case (select)
            1'b0: out = in0;  // Seleciona o registrador fonte
            1'b1: out = in1;  // Seleciona o imediato estendido
            default: out = 32'b0; // Valor padrão para evitar latch
        endcase
    end

endmodule