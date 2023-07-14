
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
function void write_txt(string file_name,logic [8-1:0]write_array[0:4-1]);
    //write data to file
    $writememh(file_name, write_array,0);
    $display("write txt finish!");
endfunction

function automatic logic[7:0]read_txt(string file_name,integer addr);
    logic[7:0] get_str[0:3];
    //read data from file
    $readmemh(file_name,get_str,0,3);
    $display("read txt finish!");
    return get_str[addr];
endfunction


endclass //read_write_txt

module rw_function;
read_write_txt rw1;
logic [7:0] my_array[0:3];
string file_name="D:/datas/IC_verification_proj/phase_learn/sample.txt";
logic[7:0] ans;
initial begin
for (int i = 0; i < 4; i = i + 1) begin
    my_array[i]=i+10;
    $display(my_array[i]);
end

rw1.write_txt(file_name,my_array); 

for (int i =0 ; i<4;i=i+1 ) begin
    ans=rw1.read_txt(file_name,i);
    $display("%2x",ans);
end

 

end

endmodule
