`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/10/24 18:45:22
// Design Name: 
// Module Name: pwmgenerate
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


module pwmgenerate(
    input CLK,
    input [3:0] n,
    output reg pwmwave
    );
    reg [3:0] cnt;
    initial begin
        pwmwave = 0;
        cnt = 0;
    end
    always @ (posedge CLK)
        begin
            if (cnt == 1'b0)
                begin
                    pwmwave <= 1;
                    cnt <= cnt + 1'b1;
                end
            else if (cnt == n)
                begin
                    pwmwave <= 0;
                    cnt <= cnt + 1'b1;
                end
            else if (cnt == 4'd9)
                begin
                    cnt <= 0;
                end
            else
                cnt <= cnt + 1'b1;
        end
endmodule
