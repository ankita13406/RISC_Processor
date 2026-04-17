module instr_reg(
    input clk, rst,
    input [15:0] ir_in,
    input ir_write,
    output reg [15:0] ir_out
);

always @(posedge clk or posedge rst) begin 
   if(rst)
     ir_out <= 16'd0;
   else if(ir_write)
     ir_out <= ir_in;
end

endmodule
