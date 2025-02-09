module Somador(
    input wire [7:0] entrada1, 
	 input wire [31:0]entrada2,
    output wire [31:0] saida
 );

assign saida = entrada1 + entrada2;
endmodule
