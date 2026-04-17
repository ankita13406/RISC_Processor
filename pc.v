module pc(
    input clk, rst,
    input pc_write,
    output reg [7:0] pc
);

always @(posedge clk or posedge rst) begin
    if(rst)
        pc <= 8'd0;
    else if(pc_write)
        pc <= pc + 8'd1;
end

endmodule
