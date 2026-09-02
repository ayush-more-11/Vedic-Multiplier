`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2026 22:48:21
// Design Name: 
// Module Name: vedic_multiplier_tb
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

module Vedic_Multiplier_tb;

    // Inputs
    reg [1:0] a;
    reg [1:0] b;

    // Outputs
    wire [3:0] m;

    // Instantiate the Unit Under Test (UUT)
    vedic_multiplier uut (
        .a(a),
        .b(b),
        .m(m)
    );

    integer i, j;

    initial begin
        // Display header
        $display("A   B   |   Product (M)");
        $display("-----------------------");

        // Test all input combinations (00 to 11)
        for (i = 0; i < 4; i = i + 1) begin
            for (j = 0; j < 4; j = j + 1) begin
                a = i;
                b = j;
                #10; // small delay for propagation
                $display("%b  x  %b  |   %b  (decimal %0d)", a, b, m, m);
            end
        end

        $display("-----------------------");
        $display("Test Completed.");
        $stop;
    end
    
    endmodule
