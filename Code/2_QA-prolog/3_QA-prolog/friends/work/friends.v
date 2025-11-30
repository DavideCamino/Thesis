// Verilog version of Prolog program friends.pl
// Conversion by QA-Prolog, written by Scott Pakin <pakin@lanl.gov>
//
// This program is intended to be passed to edif2qmasm, then to qmasm, and
// finally run on a quantum annealer.
//
// Note: This program uses 3 bit(s) for atoms and 1 bit(s) for (unsigned)
// integers.

// Define all of the symbols used in this program.
`define alice   3'd0
`define bob     3'd1
`define charlie 3'd2
`define enemies 3'd3
`define friends 3'd4
`define hates   3'd5

// Define Query(atom, atom).
module Query (P1, P2, Valid);
  input [2:0] P1;
  input [2:0] P2;
  output Valid;
  wire $v1;
  \friends/2 \friends_epkQS/2 (P1, P2, $v1);
  assign Valid = &$v1;
endmodule

// Define hates(atom, atom).
module \hates/2 (A, B, Valid);
  input [2:0] A;
  input [2:0] B;
  output Valid;
  wire [1:0] $v1;
  assign $v1[0] = A == `alice;
  assign $v1[1] = B == `bob;
  wire [1:0] $v2;
  assign $v2[0] = A == `bob;
  assign $v2[1] = B == `charlie;
  assign Valid = &$v1 | &$v2;
endmodule

// Define enemies(atom, atom).
module \enemies/2 (A, B, Valid);
  input [2:0] A;
  input [2:0] B;
  output Valid;
  wire $v1;
  \hates/2 \hates_vACGX/2 (A, B, $v1);
  wire $v2;
  \hates/2 \hates_NFduu/2 (B, A, $v2);
  assign Valid = &$v1 | &$v2;
endmodule

// Define friends(atom, atom).
module \friends/2 (A, B, Valid);
  input [2:0] A;
  input [2:0] B;
  output Valid;
  (* keep *) wire [2:0] C;
  wire [2:0] $v1;
  \enemies/2 \enemies_dRYFo/2 (A, C, $v1[0]);
  \enemies/2 \enemies_dforZ/2 (C, B, $v1[1]);
  assign $v1[2] = A != B;
  assign Valid = &$v1;
endmodule
