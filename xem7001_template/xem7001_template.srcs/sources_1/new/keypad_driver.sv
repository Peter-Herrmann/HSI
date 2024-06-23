//////////////////////////////////////////////////////////////////////////////
//// Copyright (c) AsteraLabs Inc. All rights reserved.
//// AsteraLabs Confidential Property
//// --------------------------------------------------
//// Filename: keypad_driver.sv
//// Author  : Nathaniel Downes & Abhishek Krishnan
//// Details : Decoder for Parallax 4x4 Matrix Membrane Keypad (#27899) for Summer 2024
////           High School Intern Project
//////////////////////////////////////////////////////////////////////////////

module keypad_driver (
    input  logic       i_clk,                  
    input  logic       i_rst_n,

    input  logic [3:0] i_row_bits,
    output logic [3:0] o_column_bits,

    output logic [3:0] o_key_index,
    output logic       o_key_pressed
);
    logic [3:0] col_cnt_out;

    //////////////// Put Your Column Counter Here ////////////////
    counter U_Col_Counter (.i_clk(i_clk), .i_rst(i_rst_n), .o_out(col_cnt_out) );

    assign o_column_bits = col_cnt_out;

    // Row Scanning Logic
    always_ff @(posedge i_clk, negedge i_rst_n) begin
        if (i_rst_n == 1'b0 ) begin
            o_key_index     <= '0;
            o_key_pressed <= 1'b0;
        end else begin
            //o_column_bits <= col_cnt_out;
            o_key_pressed <= 1'b1;
            case(col_cnt_out)
                4'b0001: //Column 0 low
                    case(i_row_bits)
                        4'b0001: o_key_index <= 4'd15; //Row 0 low
                        4'b0010: o_key_index <= 4'd11; //Row 1 low
                        4'b0100: o_key_index <= 4'd7;  //Row 2 low
                        4'b1000: o_key_index <= 4'd3;  //Row 3 low
                        default: begin
                            // o_key_index      <= 4'd0; 
                            o_key_pressed  <= 1'b0; 
                        end  
                    endcase
                4'b0010: //Column 1 low
                    case(i_row_bits)
                        4'b0001: o_key_index <= 4'd14; //Row 0 low
                        4'b0010: o_key_index <= 4'd10; //Row 1 low
                        4'b0100: o_key_index <= 4'd6;  //Row 2 low
                        4'b1000: o_key_index <= 4'd2;  //Row 3 low
                        default: begin
                            // o_key_index      <= 4'd0; 
                            o_key_pressed    <= 1'b0; 
                        end 
                    endcase
                4'b0100: //Column 2 low
                    case(i_row_bits)
                        4'b0001: o_key_index <= 4'd13; //Row 0 low
                        4'b0010: o_key_index <= 4'd9;  //Row 1 low
                        4'b0100: o_key_index <= 4'd5;  //Row 2 low
                        4'b1000: o_key_index <= 4'd1;  //Row 3 low
                        default: begin
                            // o_key_index      <= 4'd0; 
                            o_key_pressed    <= 1'b0; 
                        end 
                    endcase
                4'b1000: //Column 3 low
                    case(i_row_bits)
                        4'b0001: o_key_index <= 4'd12; //Row 0 low
                        4'b0010: o_key_index <= 4'd8;  //Row 1 low
                        4'b0100: o_key_index <= 4'd4;  //Row 2 low
                        4'b1000: o_key_index <= 4'd0;  //Row 3 low
                        default: begin
                            // o_key_index      <= 4'd0; 
                            o_key_pressed    <= 1'b0; 
                        end 
                    endcase
                default: begin
                    o_key_index    <= 4'd0; 
                    o_key_pressed  <= 1'b0; 
                end 
            endcase
        end
    end
endmodule

