module Mux2to1_5bits (
    input [4:0] in0,      // Primeira entrada (registrador Rt)
    input [4:0] in1,      // Segunda entrada (registrador Rd)
    input select,         // Sinal de seleção (RegDst)
    output reg [4:0] out  // Saída do multiplexador (registrador destino)
);
    always @(*) begin
        case (select)
            1'b0: out = in0;  // Seleciona Rt
            1'b1: out = in1;  // Seleciona Rd
            default: out = 5'b0; // Valor padrão
        endcase
    end
endmodule