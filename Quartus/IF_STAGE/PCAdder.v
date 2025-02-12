module PCAdder (
  	input wire [7:0] inPC,       // Valor atual do PC
  	output wire [7:0] outPC      // PC incrementado (próxima instrução)
);

    // Soma 4 ao valor atual do PC
    assign outPC = inPC + 1;

endmodule