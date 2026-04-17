module top_module(
    input clk,
    input rst,
    output halt
);

// Wires
wire [7:0] pc_out;
wire [15:0] instr;
wire [3:0] opcode;

wire [2:0] rd, rs1, rs2;
wire [7:0] rd_data1, rd_data2, rd_data3;

wire [7:0] alu_result, mul_result;
wire [7:0] write_data;
wire [8:0] mem_addr;

wire [1:0] alu_op;
wire flag_write, imem_read, ir_write;
wire mem_read, mem_write, mul_en;
wire pc_write, reg_write;

wire g,l,z;

// PC
pc PC(clk, rst, pc_write, pc_out);

// Instruction Memory
instr_mem IM(clk, pc_out, imem_read, instr);

// Instruction Register
wire [15:0] ir_out;
instr_reg IR(clk, rst, instr, ir_write, ir_out);

// Decoder
instr_decoder ID(ir_out, mem_addr, opcode, rd, rs1, rs2, );

// Register File
reg_file RF(
    clk, rst,
    rs1, rs2, 3'b000,
    reg_write,
    rd,
    write_data,
    rd_data1, rd_data2, rd_data3
);

// ALU
alu ALU(
    rd_data1,
    rd_data2,
    alu_op,
    g,l,z,
    alu_result
);

// Multiplier
mul MUL(
    rd_data1,
    rd_data2,
    mul_result,
    mul_en
);

// Data Memory
wire [7:0] mem_data;
data_mem DM(
    clk, rst,
    mem_addr,
    mem_read,
    mem_write,
    rd_data1,
    mem_data
);

// Write Back MUX
assign write_data = (mul_en) ? mul_result :
                    (mem_read) ? mem_data :
                    alu_result;

// Control Unit
control_unit CU(
    clk, rst,
    opcode,
    alu_op,
    flag_write,
    halt,
    imem_read,
    ir_write,
    mem_read,
    mem_write,
    mul_en,
    pc_write,
    reg_write
);

endmodule
