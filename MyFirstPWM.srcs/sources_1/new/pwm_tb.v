`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/24 18:54:55
// Design Name: 
// Module Name: pwm_tb
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


module pwm_tb(

    );
    reg CLK;
    reg [8:0] ctrl;
    wire pwmwave;
    pwm_top uut(
        .CLK(CLK),
        .ctrl(ctrl),
        .pwmwave(pwmwave)
    );
    always begin
        #1 CLK = ~CLK;
    end
    initial begin
        CLK = 0;
    end
    initial begin
        ctrl = 9'b000000000;
        #50 ctrl = 9'b000000001;
        #50 ctrl = 9'b000000010;
        #50 ctrl = 9'b000000100;
        #50 ctrl = 9'b000001000;
        #50 ctrl = 9'b000010000;
        #50 ctrl = 9'b000100000;
        #50 ctrl = 9'b001000000;
        #50 ctrl = 9'b010000000;
        #50 ctrl = 9'b100000000;
        #50 ctrl = 9'b010111000;
        #50 ctrl = 9'b001001011;
        #50 ctrl = 9'b111101101;
        #50 ctrl = 9'b000010011;
        #50 ctrl = 9'b000110100;
        #50 ctrl = 9'b011100100;
        #50 ctrl = 9'b000000110;
        #50 ctrl = 9'b000110110;
        #50 ctrl = 9'b010101011;
        #50 ctrl = 9'b000000011;
    end
endmodule
