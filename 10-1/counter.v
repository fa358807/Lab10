`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:24:33 09/20/2015 
// Design Name: 
// Module Name:    counter 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module counter(
clk,
rst_n,
value
    );
input clk,rst_n;
output reg [3:0] value;
reg [3:0] value_next;

always@*
begin
	if(value == 4'd15)
		value_next = 4'd0;
	else
		value_next = value +4'd1;
end

always@(posedge clk or negedge rst_n)
begin
	if(~rst_n)
		value <= 4'd0;
	else
		value <= value_next;	
end

endmodule
