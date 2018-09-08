`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2018/06/05 08:46:17
// Design Name: 
// Module Name: lkdatapath
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


module lkdatapath(
    all_reset,all_clk,sum_sel,sum_load,next_sel,next_load,mem_sel,next_zero,the_sum
    );
    input all_reset,all_clk,sum_sel,sum_load,next_sel,next_load,mem_sel;
    output next_zero;
    output [31:0] the_sum;
    wire [31:0] read_next,next_addr,read_sum,sum_result,summer_result,memory_output,read_data,addrinc_result;
    register #(32) nextaddr(read_next,next_addr,all_reset,all_clk,next_load);
    register #(32) summary(read_sum,sum_result,all_reset,all_clk,sum_load);
    multiplexer #(32) summary_mux(read_sum,0,summer_result,sum_sel);
    multiplexer #(32) nextaddr_mux(read_next,0,memory_output,next_sel);
    multiplexer #(32) dataaddr_mux(read_data,next_addr,addrinc_result,mem_sel);
    addern #(32) summer(memory_output,sum_result,summer_result,);
    addern #(32) addrinc(next_addr,1,addrinc_result,);
    comparator #(32) nzoutput(0,read_next,next_zero);
    romemory #(32) lklist(read_data[3:0],memory_output);
    assign the_sum = sum_result;
endmodule
