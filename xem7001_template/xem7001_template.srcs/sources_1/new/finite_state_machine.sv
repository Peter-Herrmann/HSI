module finite_state_machine (
    input  logic            i_clk,
    input  logic            i_rst,

    input  logic            i_keypressed,
    input  logic [3:0]      i_number,
    input  logic [1:0]      i_function,
    input  logic            i_is_number,
    input  logic            i_is_function,
    input  logic            i_clear,
    input  logic            i_equals,
    
    output logic [3:0]      o_A,
    output logic [3:0]      o_B,
    output logic [1:0]      o_OpCode,
    output logic            o_alu_en
);

    typedef enum logic [3:0] {
        OPERAND_1 = 4'b0001,
        OPERATION = 4'b0010,
        OPERAND_2 = 4'b0100,
        ENABLE    = 4'b1000
    } state_t;

    state_t state;


    always @(posedge i_clk or negedge i_rst) begin
        if (~i_rst || (i_keypressed && i_clear)) begin
            o_A         <= 'b0; 
            o_B         <= 'b0; 
            o_OpCode    <= 'b0;
            o_alu_en    <= 1'b0;
            state       <= OPERAND_1;
        end else begin
            o_alu_en    <= 1'b0; // Only enable for a single cycle

            case(state)

                OPERAND_1: begin 
                    if (i_keypressed && i_is_number) begin
                        o_A   <= i_number; 
                        state <= OPERATION;
                    end else begin
                        state <= OPERAND_1;
                    end
                end

                OPERATION: begin
                    if (i_keypressed && i_is_function) begin
                        o_OpCode <= i_function;
                        state    <= OPERAND_2;
                    end else begin
                        state    <= OPERATION;
                    end
                end

                OPERAND_2: begin 
                    if (i_keypressed && i_is_number) begin
                        o_B   <= i_number; 
                        state <= ENABLE;
                    end else begin
                        state <= OPERAND_2;
                    end
                end

                ENABLE: begin
                    if (i_equals && i_keypressed) begin
                        o_alu_en <= 1'b1;
                        state    <= OPERAND_1;
                    end else begin
                        state    <= ENABLE;
                    end
                end

                default: begin
                    o_A         <= 'b0; 
                    o_B         <= 'b0; 
                    o_OpCode    <= 'b0;
                    o_alu_en    <= 1'b0;
                    state       <= OPERAND_1;
                end

            endcase
        end
    end
endmodule
