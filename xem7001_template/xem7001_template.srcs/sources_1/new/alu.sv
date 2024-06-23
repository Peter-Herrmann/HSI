module alu(
    input  logic        i_clk,
    input  logic        i_rst_n,

    input  logic [3:0]  i_A,
    input  logic [3:0]  i_B,
    input  logic        i_aluEn,
    input  logic [1:0]  i_OpCode,

    output logic [15:0] o_out
);

    logic [15:0] alu_result;
    

    always @(*) begin
        case(i_OpCode) 
            2'd0:  alu_result  = {11'b0, $unsigned(i_A) + $unsigned(i_B)};
            2'd1:  alu_result  = {12'b0, $unsigned(i_A) - $unsigned(i_B)};
            2'd2:  alu_result  = {8'b0,  $unsigned(i_A) * $unsigned(i_B)};
            2'd3:  alu_result  = {12'b0, $unsigned(i_B)};
        endcase
    end

    always @ (posedge i_clk or negedge i_rst_n) begin
        if (~i_rst_n)
            o_out <= 'b0;
        else if (i_aluEn)
            o_out <= alu_result;
    end

endmodule
