`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03.09.2026 01:11:27
// Design Name: 
// Module Name: smart_ripple_carry_adder_tb
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

module smart_ripple_carry_adder_tb;

    parameter width = 4;

    reg  [width-1:0] a, b;
    wire [width-1:0] sum;
    wire cout;
    
    wire [width:0] result;
    assign result = {cout, sum};

    smart_ripple_carry_adder #(.width(width)) dut (
        .a(a),
        .b(b),
        .sum(sum),
        .cout(cout)
    );

    initial begin

        // Test 1: 0 + 0
        a = 4'b0000;
        b = 4'b0000;
        #10;
        $display("a=%b b=%b -> cout=%b sum=%b", a, b, cout, sum);

        // Test 2: 3 + 2 = 5
        a = 4'b0011;
        b = 4'b0010;
        #10;
        $display("a=%b b=%b -> cout=%b sum=%b", a, b, cout, sum);

        // Test 3: 7 + 5 = 12
        a = 4'b0111;
        b = 4'b0101;
        #10;
        $display("a=%b b=%b -> cout=%b sum=%b", a, b, cout, sum);

        // Test 4: 15 + 1 = 16
        a = 4'b1111;
        b = 4'b0001;
        #10;
        $display("a=%b b=%b -> cout=%b sum=%b", a, b, cout, sum);

        // Test 5: 15 + 15 = 30
        a = 4'b1111;
        b = 4'b1111;
        #10;
        $display("a=%b b=%b -> cout=%b sum=%b", a, b, cout, sum);

        $finish;
    end
    
endmodule
