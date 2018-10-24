`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/24 18:35:30
// Design Name: 
// Module Name: pwm_top
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


module pwm_top(
    input CLK,
    input [8:0] ctrl,
    output pwmwave
    );
    reg [3:0] n;
    always @ (posedge CLK)
        begin
            casex (ctrl)
                9'b1xxxxxxxx: n <= 4'd9;
                9'b01xxxxxxx: n <= 4'd8;
                9'b001xxxxxx: n <= 4'd7;
                9'b0001xxxxx: n <= 4'd6;
                9'b00001xxxx: n <= 4'd5;
                9'b000001xxx: n <= 4'd4;
                9'b0000001xx: n <= 4'd3;
                9'b00000001x: n <= 4'd2;
                9'b000000001: n <= 4'd1;
                default: n <= 4'd5;
            endcase
        end
    pwmgenerate my_pwm(
        .CLK(CLK),
        .n(n),
        .pwmwave(pwmwave)
    );
endmodule
