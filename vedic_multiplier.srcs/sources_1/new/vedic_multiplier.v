`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2026 22:46:32
// Design Name: 
// Module Name: vedic_multiplier
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


module vedic_multiplier(input [1:0] a, input [1:0] b, output [3:0] m);
    wire [2:0] w;
    wire c;

    // Partial products
    and a1(m[0], a[0], b[0]);
    and a2(w[0], a[0], b[1]);
    and a3(w[1], a[1], b[0]);

    // First half adder
    half_adder HA_1(.x(w[0]), .y(w[1]), .sum(m[1]), .carry(c));

    // Second partial product
    and a4(w[2], a[1], b[1]);

    // Second half adder
    half_adder HA_2(.x(c), .y(w[2]), .sum(m[2]), .carry(m[3]));
   
endmodule
