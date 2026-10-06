`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 11:50:17 AM
// Design Name: 
// Module Name: AddSubtract4Bit
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module AddSubtract4Bit(
    input  [3:0] A,
    input  [3:0] B,
    input        subtract,    // 0 = add, 1 = subtract
    output [3:0] result,
    output       overflow,
    output       carry_out
);

    wire [3:0] B_adjusted;
    wire [4:0] sum;  // 5 bits to capture sum and final carry_out

    assign B_adjusted = B ^ {4{subtract}};
    assign sum = {1'b0, A} + {1'b0, B_adjusted} + subtract;

    assign result = sum[3:0];
    assign carry_out = sum[4];

    assign overflow = (~(A[3] ^ B_adjusted[3])) & (A[3] ^ result[3]);

endmodule