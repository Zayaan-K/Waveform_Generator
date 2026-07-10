`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2026 10:57:38 PM
// Design Name: 
// Module Name: Waveform_Generator
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


module Waveform_Generator #(

    parameter  CLOCK_FREQ_HZ  = 100_000_000,
    parameter  FREQUENCY      = 440, //HZ
    parameter  [7:0] AMPLITUDE      = 255, 
    parameter  PHASE_DEGREES  = 0

)(

    input  wire clk,
    input  wire reset,

    input  wire [1:0] mode,

    output reg WaveOut
);

wire [7:0] sineValue;

Sin_Calculator sineLUT (
    .phase(WaveformPosition[31:24]),
    .sineValue(sineValue)
);
    localparam SQUARE   = 2'b00;
    localparam SAWTOOTH = 2'b01;
    localparam TRIANGLE = 2'b10;
    localparam SINE     = 2'b11;
    localparam [31:0] PHASE_INC = (FREQUENCY * (64'd1 << 32)) / CLOCK_FREQ_HZ;
    
    reg [31:0] WaveformPosition;
    reg [7:0] WaveTotal;
    reg [7:0]  PWMCounter;
    reg [7:0] RawWave;
    reg signed [8:0] CenteredWave;
    reg signed [17:0] ScaledWave;
    
    //freq handling
    always @(posedge clk) begin
        if (reset)
            WaveformPosition <= 32'd0;
        else
            WaveformPosition <= WaveformPosition + PHASE_INC;
    end
    
    
    //waveform output
    always @(*) begin
        case (mode) 
            
            SQUARE: begin
                RawWave = WaveformPosition[31] ? 8'd255 : 8'd0;
            end
            
            SAWTOOTH: begin
                RawWave = WaveformPosition[31:24];
            end
            
            TRIANGLE: begin
                if (WaveformPosition[31])
                    RawWave = ~WaveformPosition[30:23];
                else
                    RawWave = WaveformPosition[30:23];     
            end
                   
            SINE: begin
                RawWave = sineValue;
            end

            default: begin
                RawWave = 8'd128;
            end
            
        endcase
    end
    
     always @(posedge clk) begin
        if (reset) begin
            PWMCounter <= 8'd0;
            WaveOut    <= 1'b0;
        end else begin
            PWMCounter <= PWMCounter + 1;
            WaveOut    <= (PWMCounter < WaveTotal);
        end
    end  
    
    always @(*) begin
        CenteredWave = $signed({1'b0, RawWave}) - 9'sd128;
        ScaledWave   = CenteredWave * $signed({1'b0, AMPLITUDE});
        WaveTotal    = 8'd128 + (ScaledWave >>> 8);
    end
    

endmodule