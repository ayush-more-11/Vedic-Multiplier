`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2026 22:49:08
// Design Name: 
// Module Name: vedic_multiplier_4x4
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


module vedic_multiplier_4x4( input [3:0] a, b, output [7:0] y);

wire w0, w1, w2, w3, w4, w5;
wire [3:0] m0, m1, m2, m3;
wire [3:0] n1; 
wire c1;
    
    assign w1 = (a[3] & a[2]);
    assign w2 = (a[1] & a[0]);
    assign w3 = (b[3] & b[2]);
    assign w4 = (b[1] & b[0]);
        
    vedic_multiplier VM_0(.a(w2), .b(w4), .m(m0));
    vedic_multiplier VM_1(.a(w2), .b(w3), .m(m1));
    vedic_multiplier VM_2(.a(w1), .b(w4), .m(m2));
    vedic_multiplier VM_3(.a(w1), .b(w3), .m(m3));
    
    ripple_carry_adder RCA_1(.a(m1), .b(m2), .sum(n1). cout(c1));
    ripple_carry_adder RCA_1(.a(n1), .b[3](1'b0), .b[2](1'b0), .b[1](m0[3]), .b[0](m0[2]) .sum(n2). cout(c2));
    
    
assign y[0] = m0[0];
assign y[1] = m0[1];
endmodule
