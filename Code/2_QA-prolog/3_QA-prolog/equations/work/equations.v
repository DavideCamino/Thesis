// Verilog version of Prolog program equations.pl
// Conversion by QA-Prolog, written by Scott Pakin <pakin@lanl.gov>
//
// This program is intended to be passed to edif2qmasm, then to qmasm, and
// finally run on a quantum annealer.
//
// Note: This program uses 1 bit(s) for atoms and 3 bit(s) for (unsigned)
// integers.

// Define all of the symbols used in this program.
`define fours 1'd0

// Define Query(num, num).
module Query (B, A, Valid);
  input [2:0] B;
  input [2:0] A;
  output Valid;
  wire $v1;
  \fours/2 \fours_FDqfR/2 (B, A, $v1);
  assign Valid = &$v1;
endmodule

// Define fours(num, num).
module \fours/2 (A, B, Valid);
  input [2:0] A;
  input [2:0] B;
  output Valid;
  wire [1:0] $v1;
  assign $v1[0] = A + B == 3'd4;
  assign $v1[1] = A*B == 3'd4;
  assign Valid = &$v1;
endmodule
