module instr_mem(
    input clk,
    input [7:0] addr,
    input imem_read,
    output reg [15:0] instr
);

reg [15:0] mem[0:255];

initial begin
    $readmemh("program1.mem", mem); 
end

always @(posedge clk) begin
    if(imem_read)
        instr <= mem[addr];
end
    
endmodule
