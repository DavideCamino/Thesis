// Compute y = a && (b || c)

module circsat (a, b, c, y);
   input a, b, c;
   output y;
   wire [1:10] x;

   assign x[1] = a;
   assign x[2] = b;
   assign x[3] = c;
   assign x[4] = x[2] | x[3];
   assign x[5] = x[1] & x[4];
   assign y = x[5];
endmodule // circsat
