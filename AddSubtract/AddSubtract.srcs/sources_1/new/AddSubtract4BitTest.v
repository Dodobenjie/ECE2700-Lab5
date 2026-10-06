`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/06/2026 11:54:31 AM
// Design Name: 
// Module Name: AddSubtract4BitTest
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


module AddSubtract4BitTest;
    reg [3:0] A, B;
    reg subtract;
    wire [3:0] result;
    wire overflow, carry_out;

    AddSubtract4Bit uut (
        .A(A),
        .B(B),
        .subtract(subtract),
        .result(result),
        .overflow(overflow),
        .carry_out(carry_out)
    );

    initial begin
        // Test 1: Basic addition (3 + 5 = 8, overflow)
        A = 4'b0011; B = 4'b0101; subtract = 0; #10;

        // Test 2: Basic subtraction (5 - 3 = 2)
        A = 4'b0101; B = 4'b0011; subtract = 1; #10;

        // Test 3: Subtraction resulting in negative (3 - 5 = -2)
        A = 4'b0011; B = 4'b0101; subtract = 1; #10;

        // Test 4: Addition with negative operand (5 + (-3) = 2)
        A = 4'b0101; B = 4'b1101; subtract = 0; #10;

        // Test 5: Negative + negative (-2 + -3 = -5, no overflow)
        A = 4'b1110; B = 4'b1101; subtract = 0; #10;

        // Test 6: Overflow case (7 + 1 = -8)
        A = 4'b0111; B = 4'b0001; subtract = 0; #10;

        // Test 7: Overflow case (-8 - 1 = 7)
        A = 4'b1000; B = 4'b0001; subtract = 1; #10;

        // Test 8: Zero operand (0 + 5 = 5)
        A = 4'b0000; B = 4'b0101; subtract = 0; #10;

        // Test 9: Subtract from zero (0 - 5 = -5)
        A = 4'b0000; B = 4'b0101; subtract = 1; #10;

        // Test 10: Adding inverses (5 + (-5) = 0)
        A = 4'b0101; B = 4'b1011; subtract = 0; #10;

        // Test 11: Double negative (-5 - (-3) = -2)
        A = 4'b1011; B = 4'b1101; subtract = 1; #10;

        // Test 12: Minimum value addition (-8 + 0 = -8)
        A = 4'b1000; B = 4'b0000; subtract = 0; #10;

        // Test 13: Maximum value addition (7 + 0 = 7)
        A = 4'b0111; B = 4'b0000; subtract = 0; #10;

        // Test 14: Subtract to minimum (-7 - 1 = -8)
        A = 4'b1001; B = 4'b0001; subtract = 1; #10;

        // Test 15: Subtract to maximum (6 - (-2) = 8, overflow)
        A = 4'b0110; B = 4'b1110; subtract = 1; #10;

        $stop;
    end

endmodule