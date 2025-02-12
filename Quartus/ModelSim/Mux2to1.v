module Mux2to1 (
    input wire [7:0] in0,    // Caminho normal: PC incrementado
    input wire [7:0] in1,    // Caminho alternativo: endere�o de desvio (branchTarget)
    input wire sel,           // Sinal de controle PCSrc
    input wire clk,           // Sinal de clock
    input wire rst,           // Sinal de reset
    output wire [7:0] out     // Pr�ximo valor do PC (registrado)
);

    // Atualiza o valor de 'out' com o clock
    assign out = (sel == 1'b0) ? in0 : in1; // Sele��o do pr�ximo PC

endmodule
