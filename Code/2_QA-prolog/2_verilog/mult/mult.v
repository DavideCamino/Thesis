module mult (multiplicand, multiplier, product);
   input [1:0] multiplicand;
   input [1:0] multiplier;
   output[2:0] product;

   assign product = multiplicand * multiplier;
endmodule