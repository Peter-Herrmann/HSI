module alu_fsm (
    input logic i_clk,
    input logic i_rst,
    input logic i_keypressed,
    input logic [3 : 0] i_keypad,
    output logic [3:0] o_A,
    output logic [3:0] o_B,
    output logic [2:0] o_OpCode,
    output logic o_alu_en
);

    // States:
    parameter OPD_1 = 3'b000;
    parameter OPT = 3'b001;
    parameter OPD_2 = 3'b011;
    parameter ENABLE = 3'b111;

    logic [2:0] state;

    // Operation OPCODES:
    parameter ADD = 3'b000;
    parameter SUB = 3'b001;
    parameter MUL = 3'b011;
    parameter NOOP = 3'b111;

    logic real_key;
    keypad_second_dec dec2 (.i_dec(i_keypad), . o_actual_val(real_key));

    always @(posedge i_clk or i_rst) begin
        if (i_rst || (i_keypressed && (real_key == 4'd13))) begin
            o_alu_en <= 1'b0;
            state <= OPD_1;
        end else begin
            case(state)
                OPD_1: begin 
                    o_A   <= real_key; 
                    state <= (i_keypressed && ~(real_key == 4'd10 || real_key == 4'd11 || real_key == 4'd12 || real_key == 4'd14 || real_key == 15)) ? OPT : OPD_1;
                end

                OPT: begin
                    case(real_key) 
                        4'd4: o_OpCode <= ADD;
                        4'd8: o_OpCode <= SUB;
                        4'd12: o_OpCode <= MUL;
                        4'd15: o_OpCode <= NOOP;
                        default: o_OpCode <= NOOP;
                    endcase
                    state <= (i_keypressed && (real_key == 4'd10 || real_key == 4'd11 || real_key == 4'd12 || real_key == 4'd14 || real_key == 15)) ? OPD_2 : OPT;
                end

                OPD_2: begin 
                    o_B <= real_key; 
                    state <= (i_keypressed && ~(real_key == 4'd10 || real_key == 4'd11 || real_key == 4'd12 || real_key == 4'd14 || real_key == 15)) ? ENABLE : OPD_2;
                end

                ENABLE: begin
                    if (real_key == 4'd14) begin
                        o_alu_en <= 1'b1;
                        state    <= i_keypressed ? OPD_1 : ENABLE;
                    end else begin
                        o_alu_en <= 1'b0;
                    end
                end

                default: begin
                    o_alu_en <= 1'b0;
                    state    <= OPD_1;
                end
            endcase
        end
    end
endmodule
