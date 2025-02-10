module Mux2to1 (
    input wire [7:0] in0,    // Caminho normal: PC incrementado
    input wire [7:0] in1,    // Caminho alternativo: endere�o de desvio (branchTarget)
    input wire sel,           // Sinal de controle PCSrc
    input wire clk,           // Sinal de clock
    input wire rst,           // Sinal de reset
    output reg [7:0] out     // Pr�ximo valor do PC (registrado)
);

    // Atualiza o valor de 'out' com o clock
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            out <= 8'b0; // Resetando a sa�da
        end else begin
            out <= (sel == 1'b0) ? in0 : in1; // Sele��o do pr�ximo PC
        end
    end

endmodule
