module ShiftLeft2 (
    input [31:0] entrada,
    output wire [31:0] saida
);

assign saida = entrada << 2;
endmodule
