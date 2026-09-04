`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04.09.2026 23:47:38
// Design Name: 
// Module Name: vedic_multiplier_4bit
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


module vedic_multiplier_4bit( input [3:0] a, b, output [7:0] y, output cout);

wire a_high = a[3:2]; //w1
wire a_low = a[1:0]; //w2
wire b_high = a[3:2]; //w3
wire b_low = a[1:0]; //w4

wire [3:0] m0, m1, m2, m3;
wire [3:0] n1, n2, n3; 
wire c1, c2, c3;
wire ha_sum, ha_cout;

    
        
    vedic_multiplier VM_1(.a(a_low), .b(b_low), .m(m0));
    vedic_multiplier VM_2(.a(a_low), .b(b_high), .m(m1));
    vedic_multiplier VM_3(.a(a_high), .b(b_low), .m(m2));
    vedic_multiplier VM_4(.a(a_high), .b(b_high), .m(m3));
    
    ripple_carry_adder RCA_1(.a(m1), .b(m2), .sum(n1), .cout(c1));
    ripple_carry_adder RCA_2(.a(n1), .b({2'b00, m0[3:2]}), .sum(n2), .cout(c2));

    half_adder HA_1(.x(c1), .y(c2), .sum(ha_sum), .carry(ha_cout));
    
    ripple_carry_adder RCA_3(.a(m3), .b({ha_cout, ha_sum, n2[3:2]}), .sum(n3), .cout(c3));
    

assign y[1:0] = m0[1:0];
assign y[3:2] = n2[1:0];
assign y[7:4] = n3[4:0];

assign cout = c3;

endmodule
