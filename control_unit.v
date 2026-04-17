module control_unit(
input clk, rst,
input [3:0] opcode,

output reg [1:0] alu_op,
output reg flag_write,
output reg halt,
output reg imem_read,
output reg ir_write,
output reg mem_read,
output reg mem_write,
output reg mul_en,
output reg pc_write,
output reg reg_write
);

parameter S_rst=0, S_inst_rd=1, S_fetch=2, S_decode=3,
          S_exe=4, S_mem_read=5, S_wb=6, S_halt=7;

reg [3:0] ps, ns;

// State register
always @(posedge clk or posedge rst)
    if(rst) ps <= S_rst;
    else ps <= ns;

// Next state + outputs
always @(*) begin

// DEFAULTS (VERY IMPORTANT)
alu_op=0; flag_write=0; halt=0;
imem_read=0; ir_write=0;
mem_read=0; mem_write=0;
mul_en=0; pc_write=0; reg_write=0;

case(ps)

S_rst: ns = S_inst_rd;

S_inst_rd: begin
    imem_read=1;
    ns = S_fetch;
end

S_fetch: begin
    ir_write=1;
    ns = S_decode;
end

S_decode: begin
    case(opcode)
        4'b0000: ns=S_wb;
        4'b0001,4'b0010,4'b0011,4'b0100,4'b0101: ns=S_exe;
        4'b0110: ns=S_mem_read;
        4'b0111: ns=S_wb;
        4'b1111: ns=S_halt;
        default: ns=S_rst;
    endcase
end

S_exe: begin
    case(opcode)
        4'b0001: alu_op=2'b01;
        4'b0010: alu_op=2'b10;
        4'b0100: alu_op=2'b00;
        4'b0101: alu_op=2'b11;
        4'b0011: mul_en=1;
    endcase
    ns=S_wb;
end

S_mem_read: begin
    mem_read=1;
    ns=S_wb;
end

S_wb: begin
    if(opcode==4'b0110) reg_write=1;
    if(opcode==4'b0111) mem_write=1;

    pc_write=1;
    ns=S_inst_rd;
end

S_halt: begin
    halt=1;
    ns=S_halt;
end

endcase
end

endmodule
