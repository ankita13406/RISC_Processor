module alu(
    input [7:0] a, b,
    input [1:0] alu_op,
    output reg g, l, z,
    output reg [7:0] result
);

always @(*) begin 

// default
result = 0;
g = 0; l = 0; z = 0;

case (alu_op)

2'b01: result = a + b;

2'b10: result = a - b;

2'b00: begin   // CMP
    if(a == b) begin
        z = 1;
    end 
    else if(a > b) begin
        g = 1;
    end 
    else begin
        l = 1;
    end
end

2'b11: result = b;  // MOV

endcase

end
endmodule
