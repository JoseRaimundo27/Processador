module WB_Stage (
	 input wire [31:0] ALUResult,        // Resultado da ALU
	 input wire [31:0] MemData,          // Dado lido da memória
	 input wire [4:0] WriteReg,          // Endereço do registrador de destino
    input wire MemToReg,                // Seleciona entre dado da memória ou ALU
    input wire RegWrite,                // Habilita escrita no registrador
    output wire [31:0] WriteData,       // Dado a ser escrito no registrador
    output wire [4:0] WriteRegOut,      // Endereço do registrador destino (saída)
    output wire RegWriteOut             // Sinal de controle da escrita (saída)
);

    // Multiplexador para selecionar a fonte do dado a ser escrito
    assign WriteData = (MemToReg) ? MemData : ALUResult;

    // Propagar os sinais de controle e endereço do registrador
    assign WriteRegOut = WriteReg;
    assign RegWriteOut = RegWrite;

endmodule
