module radix8_tb;

	// Inputs
	reg [7:0] a;
	reg [7:0] b;

	// Outputs
	wire [15:0] product;

	// Instantiate the Unit Under Test (UUT)
	radix8_mul uut (
		.a(a), 
		.b(b), 
		.product(product)
	);

	initial begin
	
		  $display("---------------------------------------------------");
        $display("   A       B       PRODUCT (Radix-8 Booth)");
        $display("---------------------------------------------------");

        // Test Case 1
        a = 5;  b = 3;
        #10 $display("%4d   %4d      %4d", a, b, product);

        // Test Case 2
        a = 10; b = 4;
        #10 $display("%4d   %4d      %4d", a, b, product);
		  
		  // Test Case 3
        a = 12; b = 7;
        #10 $display("%4d   %4d      %4d", a, b, product);

        // Test Case 4
        a = 15; b = 9;
        #10 $display("%4d   %4d      %4d", a, b, product);

        // Test Case 5
        a = 25; b = 13;
        #10 $display("%4d   %4d      %4d", a, b, product);
		  
		  // Test Case 6: Large values
        a = 255; b = 2;
        #10 $display("%4d   %4d      %4d", a, b, product);

        // Test Case 7: Random mid-range
        a = 50; b = 20;
        #10 $display("%4d   %4d      %4d", a, b, product);

        // Test Case 8: Edge case (max values)
        a = 255; b = 255;
        #10 $display("%4d   %4d      %4d", a, b, product);
		  
		  $display("---------------------------------------------------");

        $finish;

	end
      
endmodule
