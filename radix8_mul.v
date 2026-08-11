module radix8_mul(
    input [7:0] a,
    input [7:0] b,
    output reg [15:0] product
    );
	 reg [15:0] partial_product;
    reg [8:0] temp_b;
    integer i;

    always @(*) begin
        product = 16'd0;
        temp_b = {b, 1'b0};
		  for (i = 0; i < 6; i = i + 3) begin
            case (temp_b[i +: 3])
                3'b000: partial_product = 16'd0;
                3'b001: partial_product = {8'd0, a};               // 1*A
                3'b010: partial_product = {8'd0, a} << 1;          // 2*A
                3'b011: partial_product = ({8'd0, a} << 1) + {8'd0, a}; // 3*A
                3'b100: partial_product = {8'd0, a} << 2;          // 4*A
					 3'b101: partial_product = ({8'd0, a} << 2) + {8'd0, a}; // 5*A
                3'b110: partial_product = ({8'd0, a} << 2) + ({8'd0, a} << 1); // 6*A
                3'b111: partial_product =
                               ({8'd0, a} << 2)
                             + ({8'd0, a} << 1)
                             +  {8'd0, a};                          // 7*A
                default: partial_product = 16'd0;
            endcase

            product = product + (partial_product << i);
        end
    end
endmodule
