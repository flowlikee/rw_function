`define data_width 32

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/07/13 20:08:38
// Design Name: 
// Module Name: reference_decoder
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
class read_write_txt;
integer WIDTH,DEPTH;
logic [`data_width-1:0]my_array_buffer[];
function new(integer width,integer depth);
    this.WIDTH=width;
    this.DEPTH=depth;
    my_array_buffer=new[this.DEPTH];
    $display("WIDTH IS %d,DEPTH IS %d",this.WIDTH,this.DEPTH);
endfunction

function write_txt(string file_name,logic [`data_width-1:0]write_array[]);
    //write data to file
    $writememh(file_name,write_array);
    $display("write txt finish!");
endfunction

function void read_txt(string file_name);
    //read data from file
    $readmemh(file_name,my_array_buffer);
    $display("read txt finish!");
endfunction
endclass //read_write_txt

module rw_function;
integer width=`data_width;
integer depth=40;
read_write_txt rw1=new(width,depth);
logic [`data_width-1:0]my_array[]=new[depth];
string file_name="D:/datas/IC_verification_proj/phase_learn/sample.txt";
initial begin
for (int i = 0; i < depth; i = i + 1) begin
    my_array[i]=i+10;
    $display(my_array[i]);
end
rw1.write_txt(file_name,my_array); 
rw1.read_txt(file_name);
for (integer i= 0;i<depth ;i=i+1) begin
        $display("my_array_buffer[%d] is %d",i,rw1.my_array_buffer[i]);
end
end
endmodule
