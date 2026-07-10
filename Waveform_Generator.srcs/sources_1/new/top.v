`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/08/2026 12:55:09 AM
// Design Name: 
// Module Name: top
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

module top(
    input  wire clk,
    input  wire reset,

    input  wire [1:0] sw,

    output wire wavePin,
    output wire [1:0] led
);

    Waveform_Generator #(
        .CLOCK_FREQ_HZ(100_000_000),
        .FREQUENCY(440),
        .AMPLITUDE(8'd255),
        .PHASE_DEGREES(0)
    ) waveformGenerator (
        .clk(clk),
        .reset(reset),
        .mode(sw[1:0]),
        .WaveOut(wavePin)
    );

    assign led[1:0] = sw[1:0];

endmodule