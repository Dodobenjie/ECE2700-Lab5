`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 11:50:44 AM
// Design Name: 
// Module Name: AddSubtractTop
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


module AddSubtractTop(
    input  [8:0] sw,
    input  [4:0] btn,
    output [3:0] an,
    output [6:0] seg,
    output [15:0] led
);

    // Map switches to operands and button to control signal
    wire [3:0] A = sw[8:5];   // Upper 4 switches for operand A
    wire [3:0] B = sw[4:1];   // Lower 4 switches for operand B
    wire subtract = sw[0];    //Switch 0 now selects addition/subtraction

    // Declare wires for result and flags
    wire [3:0] result;
    wire overflow;
    wire carry_out;

    // Instantiate the 4-bit adder/subtractor
    AddSubtract4Bit uut (
        .A(A),
        .B(B),
        .subtract(subtract),
        .result(result),
        .overflow(overflow),
        .carry_out(carry_out)
    );

    // Map result to LEDs for quick verification
    assign led[3:0]  = result;
    assign led[4]    = overflow;
    assign led[5]    = carry_out;
    assign led[15:6] = 10'b0;

    // Unused seven-segment outputs for now
    assign an  = 4'b1111;
    assign seg = 7'b1111111;

endmodule