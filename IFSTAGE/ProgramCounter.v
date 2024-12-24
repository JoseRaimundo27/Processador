module ProgramCounter (
    input wire clk,                // Clock do sistema
    input wire rst,                // Reset síncrono (ativa o PC para 0)
    input wire PCWrite,            // Habilita escrita no PC
    input wire [31:0] nextPC,      // Próximo valor do PC
    output reg [31:0] currentPC    // Valor atual do PC
);

    // Lógica de atualização do PC
    always @(posedge clk) begin
        if (rst) begin
            currentPC <= 32'b0;     // Reseta o PC para 0 (endereço inicial)
        end 
        else if (PCWrite) begin
            currentPC <= nextPC;    // Atualiza o PC com o próximo valor se PCWrite estiver ativo
        end
    end

endmodule