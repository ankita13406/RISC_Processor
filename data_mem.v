module data_mem(
    input clk, rst,
    input [8:0] addr,
    input mem_read, mem_write,
    input [7:0] write_data,
    output reg [7:0] read_data
);

reg [7:0] data_mem[0:511];

always @(posedge clk or posedge rst) begin
    if(rst)
        read_data <= 8'd0;

    else begin
        if(mem_read)
            read_data <= data_mem[addr];

        if(mem_write)
            data_mem[addr] <= write_data;
    end
end

endmodule
