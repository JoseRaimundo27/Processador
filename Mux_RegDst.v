module Mux_RegDst(
    input [4:0] rt,
    input [4:0] rd,
    input RegDst,
    output reg [4:0] WriteRegister
);
always @(*) begin
    if (RegDst == 1'b1)
        WriteRegister = rd;
    else
        WriteRegister = rt;
end
endmodule
