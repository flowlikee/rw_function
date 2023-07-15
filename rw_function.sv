
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
int my_array_buffer[];
function new(integer width,integer depth);
    this.WIDTH=width;
    this.DEPTH=depth;
    my_array_buffer=new[this.DEPTH];
    $display("WIDTH IS %d,DEPTH IS %d",this.WIDTH,this.DEPTH);
endfunction

function void write_txt(string file_name,const ref int write_array[]);
    for (integer i= 0;i<this.DEPTH ;i=i+1) begin
        my_array_buffer[i]=0;
        my_array_buffer[i]=write_array[i];
    end
    //write data to file
    $writememh(file_name, my_array_buffer,0);
    $display("write txt finish!");
endfunction

function void read_txt(string file_name);
    //read data from file
    for (integer i= 0;i<this.DEPTH ;i=i+1) begin
        my_array_buffer[i]=0;
    end
    $readmemh(file_name,my_array_buffer,0,3);
    $display("read txt finish!");
endfunction
endclass //read_write_txt

module rw_function;
read_write_txt rw1=new(width,depth);
integer width=8;
integer depth=40;
int my_array[]=new[depth];
string file_name="D:/datas/IC_verification_proj/phase_learn/sample.txt";
logic[7:0] ans;
initial begin
for (int i = 0; i < depth; i = i + 1) begin
    my_array[i]=i+10;
    $display(my_array[i]);
end

rw1.write_txt(file_name,my_array); 
for (integer i= 0;i<depth ;i=i+1) begin
        $display("my_array_buffer[%d] is %d",i,rw1.my_array_buffer[i]);
    end

// for (int i =0 ; i<4;i=i+1 ) begin
//     ans=rw1.read_txt(file_name,i);
//     $display("%2x",ans);
// end

 

end

endmodule
