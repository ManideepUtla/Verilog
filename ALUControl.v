`timescale 1ns / 1ps
module ALUControl (ALUOp0, ALUOp1, instruction_part, operation_code);

input ALUOp0, ALUOp1;
input [10:0] instruction_part;
output reg [3:0] operation_code;

wire [1:0] ALUOp = {ALUOp1, ALUOp0};

always @ (ALUOp0, ALUOp1, instruction_part) begin

    casex(ALUOp)
        2'b00: operation_code = 4'b0010;
        2'bx1: operation_code = 4'b0111;
        2'b1x: begin

            casex(instruction_part)
                11'b10001011000: operation_code = 4'b0010;
                11'b11001011000: operation_code = 4'b0110;
                11'b10001010000: operation_code = 4'b0000;
                11'b10101010000: operation_code = 4'b0001;
                default: operation_code = 4'bz;
                
            endcase
end
default: operation_code = 4'bz;

    endcase

end
endmodule
