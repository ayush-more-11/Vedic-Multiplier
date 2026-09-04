`timescale 1ns / 1ps

//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.09.2026 00:19:57
// Design Name: 
// Module Name: vedic_multiplier_4bit_tb
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


module vedic_multiplier_4bit_tb();

    // Testbench signals
    reg [3:0] a;
    reg [3:0] b;
    wire [7:0] y;
    wire cout;

    // Verification variables
    integer i, j;
    reg [7:0] expected_y;
    integer error_count = 0;

    // Instantiate the Unit Under Test (UUT)
    vedic_multiplier_4bit uut (
        .a(a), 
        .b(b), 
        .y(y), 
        .cout(cout)
    );

    initial begin
        $display("Starting Exhaustive Verification...");
        
        // Loop through all 256 possible input combinations
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                a = i;
                b = j;
                
                // Behavioral multiplication for golden reference
                expected_y = a * b; 
                
                // 10ns delay for combinational logic propagation
                #10; 

                // Self-checking logic
                if (y !== expected_y) begin
                    $display("ERROR at %0t ns: a=%d, b=%d | expected=%d, got=%d (cout=%b)", 
                              $time, a, b, expected_y, y, cout);
                    error_count = error_count + 1;
                end
            end
        end

        #10;
        
        // Final reporting
        if (error_count == 0) begin
            $display("========================================");
            $display("SUCCESS: All 256 test cases passed.");
            $display("========================================");
        end else begin
            $display("========================================");
            $display("FAILED: %0d errors found.", error_count);
            $display("========================================");
        end

        $finish;
    end

endmodule



