//////////////////////////////////////////////////////////////////////////////
//// Copyright (c) AsteraLabs Inc. All rights reserved.
//// AsteraLabs Confidential Property
//// --------------------------------------------------
//// Filename: keypad_decoder.sv
//// Author  : Nathaniel Downes & Abhishek Krishnan
//// Details : Decoder for Parallax 4x4 Matrix Membrane Keypad (#27899) for Summer 2024
////           High School Intern Project
//////////////////////////////////////////////////////////////////////////////

module keypad_decoder (
    input  logic       clk,                  
    input  logic       rst,
    input  logic [3:0] RowIn,
    output logic [3:0] KeyOut,
    output logic [3:0] ColOut,
    output logic       KeyPressed
);
    logic [3:0] col_cnt_out;

    //////////////// Put Your Column Counter Here ////////////////
    counter U_Col_Counter (.i_clk(clk), .i_rst(rst), .o_out(col_cnt_out) );

    assign ColOut = col_cnt_out;

    // Row Scanning Logic
    always_ff @(posedge clk, negedge rst) begin
        if (rst == 1'b0 ) begin
            KeyOut     <= '0;
            KeyPressed <= 1'b0;
        end else begin
            //ColOut <= col_cnt_out;
            KeyPressed <= 1'b1;
            case(col_cnt_out)
                4'b0001: //Column 0 low
                    case(RowIn)
                        4'b0001: KeyOut <= 4'd15; //Row 0 low
                        4'b0010: KeyOut <= 4'd11; //Row 1 low
                        4'b0100: KeyOut <= 4'd7; //Row 2 low
                        4'b1000: KeyOut <= 4'd3; //Row 3 low
                        default: begin
                            KeyOut      <= 4'd0; 
                            KeyPressed  <= 1'b0; 
                        end  
                    endcase
                4'b0010: //Column 1 low
                    case(RowIn)
                        4'b0001: KeyOut <= 4'd14; //Row 0 low
                        4'b0010: KeyOut <= 4'd10; //Row 1 low
                        4'b0100: KeyOut <= 4'd6; //Row 2 low
                        4'b1000: KeyOut <= 4'd2; //Row 3 low
                        default: begin
                            KeyOut      <= 4'd0; 
                            KeyPressed  <= 1'b0; 
                        end 
                    endcase
                4'b0100: //Column 2 low
                    case(RowIn)
                        4'b0001: KeyOut <= 4'd13; //Row 0 low
                        4'b0010: KeyOut <= 4'd9; //Row 1 low
                        4'b0100: KeyOut <= 4'd5; //Row 2 low
                        4'b1000: KeyOut <= 4'd1; //Row 3 low
                        default: begin
                            KeyOut      <= 4'd0; 
                            KeyPressed  <= 1'b0; 
                        end 
                    endcase
                4'b1000: //Column 3 low
                    case(RowIn)
                        4'b0001: KeyOut <= 4'd12; //Row 0 low
                        4'b0010: KeyOut <= 4'd8; //Row 1 low
                        4'b0100: KeyOut <= 4'd4; //Row 2 low
                        4'b1000: KeyOut <= 4'd0; //Row 3 low
                        default: begin
                            KeyOut      <= 4'd0; 
                            KeyPressed  <= 1'b0; 
                        end 
                    endcase
                default: begin
                    KeyOut      <= 4'd0; 
                    KeyPressed  <= 1'b0; 
                end 
            endcase
        end
    end
endmodule

