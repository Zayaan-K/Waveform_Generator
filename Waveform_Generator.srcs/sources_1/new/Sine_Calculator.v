`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/09/2026 11:41:33 PM
// Design Name: 
// Module Name: Sine_Calculator
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


module Sin_Calculator(
    input  wire [7:0] phase,
    output reg  [7:0] sineValue
);

    wire [1:0] quadrant;
    wire [5:0] index;

    reg [5:0] tableIndex;
    reg [7:0] quarterValue;

    assign quadrant = phase[7:6];
    assign index    = phase[5:0]; 


    always @(*) begin
        case (quadrant)
            2'b00: tableIndex = index;       
            2'b01: tableIndex = 6'd63 - index; 
            2'b10: tableIndex = index;       
            2'b11: tableIndex = 6'd63 - index; 
        endcase
    end


    always @(*) begin
        case (tableIndex)
            6'd0:  quarterValue = 8'd0;
            6'd1:  quarterValue = 8'd3;
            6'd2:  quarterValue = 8'd6;
            6'd3:  quarterValue = 8'd9;
            6'd4:  quarterValue = 8'd13;
            6'd5:  quarterValue = 8'd16;
            6'd6:  quarterValue = 8'd19;
            6'd7:  quarterValue = 8'd22;
            6'd8:  quarterValue = 8'd25;
            6'd9:  quarterValue = 8'd28;
            6'd10: quarterValue = 8'd31;
            6'd11: quarterValue = 8'd34;
            6'd12: quarterValue = 8'd37;
            6'd13: quarterValue = 8'd40;
            6'd14: quarterValue = 8'd43;
            6'd15: quarterValue = 8'd46;
            6'd16: quarterValue = 8'd49;
            6'd17: quarterValue = 8'd52;
            6'd18: quarterValue = 8'd55;
            6'd19: quarterValue = 8'd58;
            6'd20: quarterValue = 8'd61;
            6'd21: quarterValue = 8'd64;
            6'd22: quarterValue = 8'd66;
            6'd23: quarterValue = 8'd69;
            6'd24: quarterValue = 8'd72;
            6'd25: quarterValue = 8'd74;
            6'd26: quarterValue = 8'd77;
            6'd27: quarterValue = 8'd79;
            6'd28: quarterValue = 8'd82;
            6'd29: quarterValue = 8'd84;
            6'd30: quarterValue = 8'd86;
            6'd31: quarterValue = 8'd89;
            6'd32: quarterValue = 8'd91;
            6'd33: quarterValue = 8'd93;
            6'd34: quarterValue = 8'd95;
            6'd35: quarterValue = 8'd97;
            6'd36: quarterValue = 8'd99;
            6'd37: quarterValue = 8'd101;
            6'd38: quarterValue = 8'd103;
            6'd39: quarterValue = 8'd105;
            6'd40: quarterValue = 8'd107;
            6'd41: quarterValue = 8'd108;
            6'd42: quarterValue = 8'd110;
            6'd43: quarterValue = 8'd112;
            6'd44: quarterValue = 8'd113;
            6'd45: quarterValue = 8'd114;
            6'd46: quarterValue = 8'd116;
            6'd47: quarterValue = 8'd117;
            6'd48: quarterValue = 8'd118;
            6'd49: quarterValue = 8'd119;
            6'd50: quarterValue = 8'd120;
            6'd51: quarterValue = 8'd121;
            6'd52: quarterValue = 8'd122;
            6'd53: quarterValue = 8'd123;
            6'd54: quarterValue = 8'd124;
            6'd55: quarterValue = 8'd124;
            6'd56: quarterValue = 8'd125;
            6'd57: quarterValue = 8'd126;
            6'd58: quarterValue = 8'd126;
            6'd59: quarterValue = 8'd126;
            6'd60: quarterValue = 8'd127;
            6'd61: quarterValue = 8'd127;
            6'd62: quarterValue = 8'd127;
            6'd63: quarterValue = 8'd127;
            default: quarterValue = 8'd0;
        endcase
    end


    always @(*) begin
        case (quadrant)
            2'b00: sineValue = 8'd128 + quarterValue;
            2'b01: sineValue = 8'd128 + quarterValue;
            2'b10: sineValue = 8'd128 - quarterValue;
            2'b11: sineValue = 8'd128 - quarterValue;
            default: sineValue = 8'd128;
        endcase
    end

endmodule
