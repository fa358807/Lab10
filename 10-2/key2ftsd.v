`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:21:38 09/20/2015 
// Design Name: 
// Module Name:    key2ftsd 
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
module key2ftsd(
key,
dig0,
dig1
    );
input [3:0] key;
output reg [3:0] dig0,dig1;

always@*
begin
	if((key==4'd0)||(key==4'd7)||(key==4'd15))//si
	begin
		dig0 = 4'd5;
		dig1 = 4'd1;
	end
	else if((key==4'd1)||(key==4'd8))//do
	begin
		dig0 = 4'd13;
		dig1 = 4'd0;
	end
	else if((key==4'd2)||(key==4'd9))//re
	begin
		dig0 = 4'd4;
		dig1 = 4'd14;
	end
	else if((key==4'd3)||(key==4'd11))//me
	begin
		dig0 = 4'd3;
		dig1 = 4'd14;
	end
	else if((key==4'd4)||(key==4'd12))//fa
	begin
		dig0 = 4'd15;
		dig1 = 4'd10;
	end
	else if((key==4'd5)||(key==4'd13))//so
	begin
		dig0 = 4'd5;
		dig1 = 4'd0;
	end
	else if((key==4'd10)||(key==4'd6)||(key==4'd14))//la
	begin
		dig0 = 4'd2;
		dig1 = 4'd10;
	end
	else
	begin
		dig0 = 4'd0;
		dig1 = 4'd0;
	end
end




endmodule
