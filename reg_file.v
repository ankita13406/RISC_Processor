module reg_file(
    input clk, rst,
    input [2:0] rd_addr1, rd_addr2, rd_addr3,
    input reg_write,
    input [2:0] wr_addr,
    input [7:0] wr_data,
    output [7:0] rd_data1, rd_data2, rd_data3
);

reg [7:0] reg_mem[0:7];
integer i;

// Combinational read
assign rd_data1 = reg_mem[rd_addr1];
assign rd_data2 = reg_mem[rd_addr2];
assign rd_data3 = reg_mem[rd_addr3];

// Sequential write
always @(posedge clk or posedge rst) begin 
    if(rst) begin
        for(i = 0; i < 8; i = i + 1)
            reg_mem[i] <= 8'd0;
    end
    else if(reg_write) begin
        reg_mem[wr_addr] <= wr_data;
    end
end

endmodule
