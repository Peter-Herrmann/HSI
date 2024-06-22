`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2024 11:45:08 PM
// Design Name: 
// Module Name: keypad_second_dec
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


module keypad_second_dec(
input logic [3:0] i_dec,
output logic [3:0] o_actual_val

    );
    
always @(*) begin
case(i_dec)
4'd0: assign o_actual_val = 4'd1;
4'd1: assign o_actual_val = 4'd2;
4'd2: assign o_actual_val = 4'd3;
4'd3: assign o_actual_val = 4'd10;
4'd4: assign o_actual_val = 4'd4;
4'd5: assign o_actual_val = 4'd5;
4'd6: assign o_actual_val = 4'd6;
4'd7: assign o_actual_val = 4'd11;
4'd8: assign o_actual_val = 4'd7;
4'd9: assign o_actual_val = 4'd8;
4'd10: assign o_actual_val = 4'd9;
4'd11: assign o_actual_val = 4'd12;
4'd12: assign o_actual_val = 4'd13;
4'd13: assign o_actual_val = 4'd0;
4'd14: assign o_actual_val = 4'd14;
4'd15: assign o_actual_val = 4'd15;
endcase
end   
    
endmodule
