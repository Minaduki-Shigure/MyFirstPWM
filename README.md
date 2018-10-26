# MyFirstPWM
This is a simple Verilog project to generate a PWM wave.  
这是一个生成PWM波形的Verilog项目。
## To begin with
程序利用Artix-7开发板上自带的50MHz时钟，生成频率为5MHz的PWM波形。其中，占空比可由拨码开关控制。  
项目包含两个主要的源文件，为`pwm_top.v`和`pwmgenerate.v`,同时包含一个仿真文件`pwm-tb.v`.
## About `pwm_top.v`
文件为项目的顶层文件，输入为`CLK`(连接到板上时钟)和`[8:0]ctrl`(连接到拨码开关)，输出为`pwmwave`，即产生的波形。  
```
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
```
上图为文件中包含的优先编码器模块，作用为将拨码开关的状态转化为实际占空比，存入`reg`型变量`[3:0]n`中。  
其中，当开关`SW8`输出为1时，`n`值为9，对应的占空比为90%，`SW7`为1且`SW8`为0时，`n`值为8，对应的占空比为80%，其他亦然，**高位优先级更高**。  
特别的，当所有开关均输出为0时，占空比默认值为50%。
## About `pwmgenerate.v`
文件为生成PWM波形的文件，输入为`CLK`(时钟信号)和`n`(占空比参数)，输出为`pwmwave`。  
采用`reg`型变量`[3:0]cnt`进行计数。  
当`cnt==0`时，将波形输出置为1，并且每过一个时钟周期，将cnt的值+1，若`cnt==10`，则开始一个新的PWM周期，此时重新将波形输出置为1，并且将`cnt`的值重置为**1**。  
若`cnt==n`，则波形输出置为0，生成下降沿。
## About `pwm_tb.v`(Test Bench)
仿真程序下，为了方便，将CLK设置为`#1 CLK = ~CLK;` 即时钟周期为2ps，实际效果没有区别。  
仿真测试了当拨码开关单独打开和一起打开时测试的结果，以验证PWM生成代码和优先编码器的工作状况。  
![pwm_tb_result](http://www.in-flame-team.com/pwm_tb_result.png)
可以看出仿真结果满足需求。
