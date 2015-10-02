`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:13:27 09/18/2015 
// Design Name: 
// Module Name:    speaker 
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
module speaker(
clk, // clock from crystal
rst_n, // active low reset
value,
dip,
audio_appsel, // playing mode selection
audio_sysclk, // control clock for DAC (from crystal)
audio_bck, // bit clock of audio data (5MHz)
audio_ws, // left/right parallel to serial control
audio_data // serial output audio data
);
// I/O declaration
input clk; // clock from the crystal
input rst_n; // active low reset
input [3:0] value;
input dip;
output audio_appsel; // playing mode selection
output audio_sysclk; // control clock for DAC (from crystal)
output audio_bck; // bit clock of audio data (5MHz)
output audio_ws; // left/right parallel to serial control
output audio_data; // serial output audio data
// Declare internal nodes
wire [15:0] audio_in_left, audio_in_right;
wire [19:0] note_div_right,note_div_left;

sound_set sound_set(
.value(value),
.dip(dip),
.note_div_left(note_div_left),
.note_div_right(note_div_right)
    );

// Note generation
buzzer_control buz_ctl_left(
.clk(clk), // clock from crystal
.rst_n(rst_n), // active low reset
.note_div(note_div_left), // div for note generation
.audio_left(audio_in_left), // left sound audio
.audio_right() // right sound audio
);

buzzer_control buz_ctl_right(
.clk(clk), // clock from crystal
.rst_n(rst_n), // active low reset
.note_div(note_div_right), // div for note generation
.audio_left(), // left sound audio
.audio_right(audio_in_right) // right sound audio
);

// Speaker controllor
speaker_control Usc(
.clk(clk), // clock from the crystal
.rst_n(rst_n), // active low reset
.audio_in_left(audio_in_left), // left channel audio data input
.audio_in_right(audio_in_right), // right channel audio data input
.audio_appsel(audio_appsel), // playing mode selection
.audio_sysclk(audio_sysclk), // control clock for DAC (from crystal)
.audio_bck(audio_bck), // bit clock of audio data (5MHz)
.audio_ws(audio_ws), // left/right parallel to serial control
.audio_data(audio_data) // serial output audio data
);
	 


endmodule
