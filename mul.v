module mul(
    input [7:0] a,
    input [7:0] b,
    input mul_en,
    output reg [7:0] result
);

always @(*) begin 
    if(mul_en)
        result = a * b;
    else
        result = 8'd0;
end

endmodule
