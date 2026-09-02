`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2026 00:49:31
// Design Name: 
// Module Name: smart_ripple_carry_adder
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


module smart_ripple_carry_adder # (parameter width = 4)
(
    input [width-1:0] a, b,
    output [width-1:0] sum,
    output cout
);

wire [width:0] carry; // connects all c0 to cout hence with:0 not width-1:0

assign carry[0] = 1'b0;
assign cout = carry[width];

genvar i;
generate 
    for ( i = 0; i < width ; i = i + 1) begin : FA_ints
        full_adder FA(.a(a[i]), .b(b[i]), .cin(carry[i]), .sum(sum[i]), .cout(carry[i+1]));
        end 
endgenerate
    
endmodule
