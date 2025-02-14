module Mux2to1 (
  	input wire [7:0] in0,    // Caminho normal: PC incrementado
  	input wire [7:0] in1,    // Caminho alternativo: endereço de desvio (branchTarget)
    input wire sel,           // Sinal de controle PCSrc
  	output wire [7:0] out    // Próximo valor do PC
);

    // Seleção do próximo PC com base no sinal de controle
    assign out = (sel == 1'b0) ? in0 : in1;

endmodule