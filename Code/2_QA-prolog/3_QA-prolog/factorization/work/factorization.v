// Verilog version of Prolog program factorization.pl
// Conversion by QA-Prolog, written by Scott Pakin <pakin@lanl.gov>
//
// This program is intended to be passed to edif2qmasm, then to qmasm, and
// finally run on a quantum annealer.
//
// Note: This program uses 1 bit(s) for atoms and 3 bit(s) for (unsigned)
// integers.

// Define all of the symbols used in this program.
`define mult 1'd0

// Define mult(num, num, num).
module \mult/3 (A, B, C, Valid);
  input [2:0] A;
  input [2:0] B;
  input [2:0] C;
  output Valid;
  wire $v1;
  assign $v1 = C == A*B;
  assign Valid = &$v1;
endmodule

// Define Query(num, num).
module Query (A, B, Valid);
  input [2:0] A;
  input [2:0] B;
  output Valid;
  wire $v1;
  \mult/3 \mult_oaUHH/3 (A, B, 3'd6, $v1);
  assign Valid = &$v1;
endmodule
