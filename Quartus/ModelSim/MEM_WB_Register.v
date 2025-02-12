module MEM_WB_Register (
    input wire clk,
    input wire rst,
    input wire [31:0] inALUResult,
    input wire [31:0] inReadData,
    input wire [4:0] inWriteReg,
    input wire inMemToReg,
    input wire inRegWrite,
    output reg [31:0] outALUResult,
    output reg [31:0] outReadData,
    output reg [4:0] outWriteReg,
    output reg outMemToReg,
    output reg outRegWrite
);

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            outALUResult <= 32'b0;
            outReadData <= 32'b0;
            outWriteReg <= 5'b0;
            outMemToReg <= 1'b0;
            outRegWrite <= 1'b0;
        end else begin
            outALUResult <= inALUResult;
            outReadData <= inReadData;
            outWriteReg <= inWriteReg;
            outMemToReg <= inMemToReg;
            outRegWrite <= inRegWrite;
        end
    end
endmodule
