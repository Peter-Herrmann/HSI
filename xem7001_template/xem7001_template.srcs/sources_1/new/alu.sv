module alu(
    input  logic        i_clk,
    input  logic        i_rst_n,

    input  logic [3:0]  i_A,
    input  logic [3:0]  i_B,
    input  logic        i_aluEn,
    input  logic [1:0]  i_OpCode,

    output logic [15:0] o_out
);

    logic [15:0] alu_result, result_a, result_b, result_c, result_d;
    
    alu_operation_a U_alu_operation_a( .i_A (i_A), .i_B (i_B), .o_result (result_a) );
    alu_operation_b U_alu_operation_b( .i_A (i_A), .i_B (i_B), .o_result (result_b) );
    alu_operation_c U_alu_operation_c( .i_A (i_A), .i_B (i_B), .o_result (result_c) );
    alu_operation_d U_alu_operation_d( .i_A (i_A), .i_B (i_B), .o_result (result_d) );

    always @(*) begin
        case(i_OpCode) 
            2'd0: alu_result = result_a;
            2'd1: alu_result = result_b;
            2'd2: alu_result = result_c;
            2'd3: alu_result = result_d;
        endcase
    end

    always @ (posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)
            o_out <= 'b0;
        else if (i_aluEn)
            o_out <= alu_result;
    end

endmodule
