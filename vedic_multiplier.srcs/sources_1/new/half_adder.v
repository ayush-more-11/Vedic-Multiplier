`timescale 1ns / 1ps

module half_adder(input x, y, output sum, carry);
    assign sum = x ^ y;
    assign carry = x & y;
endmodule