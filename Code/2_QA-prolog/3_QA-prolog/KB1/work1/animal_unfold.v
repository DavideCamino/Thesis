// Verilog version of Prolog program animal_unfold.pl
// Conversion by QA-Prolog, written by Scott Pakin <pakin@lanl.gov>
//
// This program is intended to be passed to edif2qmasm, then to qmasm, and
// finally run on a quantum annealer.
//
// Note: This program uses 6 bit(s) for atoms and 1 bit(s) for (unsigned)
// integers.

// Define all of the symbols used in this program.
`define Individual_X_cannot_belong_and_not_belong_to_class_Y 6'd0
`define ancestor                                             6'd1
`define ancestor1                                            6'd2
`define ancestor2                                            6'd3
`define ancestor3                                            6'd4
`define ancestor4                                            6'd5
`define ancestor5                                            6'd6
`define ancestor6                                            6'd7
`define ancestor7                                            6'd8
`define ancestor8                                            6'd9
`define ancestor9                                            6'd10
`define ancestor_unfold                                      6'd11
`define animal                                               6'd12
`define beary                                                6'd13
`define bird                                                 6'd14
`define carnivore                                            6'd15
`define class                                                6'd16
`define disjointClasses                                      6'd17
`define fish                                                 6'd18
`define hasproperty                                          6'd19
`define herbivore                                            6'd20
`define hunt                                                 6'd21
`define isA                                                  6'd22
`define isNotA                                               6'd23
`define isa                                                  6'd24
`define mammal                                               6'd25
`define penguin                                              6'd26
`define penguy                                               6'd27
`define polar_bear                                           6'd28
`define predator                                             6'd29
`define prey                                                 6'd30
`define reindeer                                             6'd31
`define reiny                                                6'd32
`define reiny_b                                              6'd33
`define reiny_c                                              6'd34
`define sardine                                              6'd35
`define sardy                                                6'd36
`define seal                                                 6'd37
`define sealy                                                6'd38
`define sonOf                                                6'd39
`define subClass                                             6'd40
`define subclass                                             6'd41

// Define hasproperty(atom, atom, atom).
module \hasproperty/3 (A, B, C, Valid);
  input [5:0] A;
  input [5:0] B;
  input [5:0] C;
  output Valid;
  wire [2:0] $v1;
  assign $v1[0] = A == `beary;
  assign $v1[1] = B == `hunt;
  assign $v1[2] = C == `sealy;
  wire [2:0] $v2;
  assign $v2[0] = A == `beary;
  assign $v2[1] = B == `hunt;
  assign $v2[2] = C == `penguy;
  wire [2:0] $v3;
  assign $v3[0] = A == `sealy;
  assign $v3[1] = B == `hunt;
  assign $v3[2] = C == `penguy;
  wire [2:0] $v4;
  assign $v4[0] = A == `penguy;
  assign $v4[1] = B == `hunt;
  assign $v4[2] = C == `sardy;
  wire [2:0] $v5;
  assign $v5[0] = A == `reiny;
  assign $v5[1] = B == `hunt;
  assign $v5[2] = C == `sardy;
  wire [2:0] $v6;
  assign $v6[0] = A == `reiny_b;
  assign $v6[1] = B == `sonOf;
  assign $v6[2] = C == `reiny;
  wire [2:0] $v7;
  assign $v7[0] = A == `reiny_c;
  assign $v7[1] = B == `sonOf;
  assign $v7[2] = C == `reiny_b;
  assign Valid = &$v1 | &$v2 | &$v3 | &$v4 | &$v5 | &$v6 | &$v7;
endmodule

// Define ancestor9(atom, atom).
module \ancestor9/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  (* keep *) wire [5:0] C;
  wire [1:0] $v1;
  \ancestor8/2 \ancestor8_rFUbF/2 (A, C, $v1[0]);
  \hasproperty/3 \hasproperty_GZwqK/3 (B, `sonOf, C, $v1[1]);
  assign Valid = &$v1;
endmodule

// Define ancestor_unfold(atom, atom).
module \ancestor_unfold/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  wire $v1;
  \ancestor1/2 \ancestor1_zpKPQ/2 (A, B, $v1);
  wire $v2;
  \ancestor2/2 \ancestor2_JVYnj/2 (A, B, $v2);
  wire $v3;
  \ancestor3/2 \ancestor3_pkbyK/2 (A, B, $v3);
  wire $v4;
  \ancestor4/2 \ancestor4_sugPz/2 (A, B, $v4);
  wire $v5;
  \ancestor5/2 \ancestor5_FPVeD/2 (A, B, $v5);
  wire $v6;
  \ancestor6/2 \ancestor6_lMyqJ/2 (A, B, $v6);
  wire $v7;
  \ancestor7/2 \ancestor7_vDwvC/2 (A, B, $v7);
  wire $v8;
  \ancestor8/2 \ancestor8_XBfpm/2 (A, B, $v8);
  wire $v9;
  \ancestor9/2 \ancestor9_gfJwJ/2 (A, B, $v9);
  assign Valid = &$v1 | &$v2 | &$v3 | &$v4 | &$v5 | &$v6 | &$v7 | &$v8 | &$v9;
endmodule

// Define Query(atom).
module Query (X, Valid);
  input [5:0] X;
  output Valid;
  wire $v1;
  \class/1 \class_omMeI/1 (X, $v1);
  assign Valid = &$v1;
endmodule

// Define class(atom).
module \class/1 (A, Valid);
  input [5:0] A;
  output Valid;
  wire $v1;
  assign $v1 = A == `animal;
  wire $v2;
  assign $v2 = A == `mammal;
  wire $v3;
  assign $v3 = A == `polar_bear;
  wire $v4;
  assign $v4 = A == `seal;
  wire $v5;
  assign $v5 = A == `reindeer;
  wire $v6;
  assign $v6 = A == `fish;
  wire $v7;
  assign $v7 = A == `sardine;
  wire $v8;
  assign $v8 = A == `bird;
  wire $v9;
  assign $v9 = A == `penguin;
  wire $v10;
  assign $v10 = A == `herbivore;
  wire $v11;
  assign $v11 = A == `carnivore;
  wire $v12;
  assign $v12 = A == `prey;
  wire $v13;
  assign $v13 = A == `predator;
  assign Valid = &$v1 | &$v2 | &$v3 | &$v4 | &$v5 | &$v6 | &$v7 | &$v8 | &$v9 | &$v10 | &$v11 | &$v12 | &$v13;
endmodule

// Define subClass(atom, atom).
module \subClass/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  wire $v1;
  \subclass/2 \subclass_ZdnDu/2 (A, B, $v1);
  (* keep *) wire [5:0] E;
  wire [1:0] $v2;
  \subclass/2 \subclass_CzHmn/2 (A, E, $v2[0]);
  \subclass/2 \subclass_zZCMC/2 (E, B, $v2[1]);
  (* keep *) wire [5:0] J;
  (* keep *) wire [5:0] K;
  wire [2:0] $v3;
  \subclass/2 \subclass_YWuuj/2 (A, J, $v3[0]);
  \subclass/2 \subclass_ZSSRp/2 (J, K, $v3[1]);
  \subclass/2 \subclass_OVrbX/2 (K, B, $v3[2]);
  assign Valid = &$v1 | &$v2 | &$v3;
endmodule

// Define disjointClasses(atom, atom).
module \disjointClasses/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  wire [1:0] $v1;
  assign $v1[0] = A == `carnivore;
  assign $v1[1] = B == `herbivore;
  assign Valid = &$v1;
endmodule

// Define isa(atom, atom).
module \isa/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  wire [1:0] $v1;
  assign $v1[0] = A == `beary;
  assign $v1[1] = B == `polar_bear;
  wire [1:0] $v2;
  assign $v2[0] = A == `sealy;
  assign $v2[1] = B == `seal;
  wire [1:0] $v3;
  assign $v3[0] = A == `reiny;
  assign $v3[1] = B == `reindeer;
  wire [1:0] $v4;
  assign $v4[0] = A == `reiny_b;
  assign $v4[1] = B == `reindeer;
  wire [1:0] $v5;
  assign $v5[0] = A == `reiny_c;
  assign $v5[1] = B == `reindeer;
  wire [1:0] $v6;
  assign $v6[0] = A == `sardy;
  assign $v6[1] = B == `sardine;
  wire [1:0] $v7;
  assign $v7[0] = A == `penguy;
  assign $v7[1] = B == `penguin;
  assign Valid = &$v1 | &$v2 | &$v3 | &$v4 | &$v5 | &$v6 | &$v7;
endmodule

// Define ancestor2(atom, atom).
module \ancestor2/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  (* keep *) wire [5:0] C;
  wire [1:0] $v1;
  \ancestor1/2 \ancestor1_tljbv/2 (A, C, $v1[0]);
  \hasproperty/3 \hasproperty_CtYVx/3 (B, `sonOf, C, $v1[1]);
  assign Valid = &$v1;
endmodule

// Define ancestor4(atom, atom).
module \ancestor4/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  (* keep *) wire [5:0] C;
  wire [1:0] $v1;
  \ancestor3/2 \ancestor3_qptSg/2 (A, C, $v1[0]);
  \hasproperty/3 \hasproperty_fmwcF/3 (B, `sonOf, C, $v1[1]);
  assign Valid = &$v1;
endmodule

// Define ancestor5(atom, atom).
module \ancestor5/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  (* keep *) wire [5:0] C;
  wire [1:0] $v1;
  \ancestor4/2 \ancestor4_JLLrB/2 (A, C, $v1[0]);
  \hasproperty/3 \hasproperty_XQwjb/3 (B, `sonOf, C, $v1[1]);
  assign Valid = &$v1;
endmodule

// Define subclass(atom, atom).
module \subclass/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  wire [1:0] $v1;
  assign $v1[0] = A == `mammal;
  assign $v1[1] = B == `animal;
  wire [1:0] $v2;
  assign $v2[0] = A == `bird;
  assign $v2[1] = B == `animal;
  wire [1:0] $v3;
  assign $v3[0] = A == `fish;
  assign $v3[1] = B == `animal;
  wire [1:0] $v4;
  assign $v4[0] = A == `polar_bear;
  assign $v4[1] = B == `mammal;
  wire [1:0] $v5;
  assign $v5[0] = A == `seal;
  assign $v5[1] = B == `mammal;
  wire [1:0] $v6;
  assign $v6[0] = A == `reindeer;
  assign $v6[1] = B == `mammal;
  wire [1:0] $v7;
  assign $v7[0] = A == `sardine;
  assign $v7[1] = B == `fish;
  wire [1:0] $v8;
  assign $v8[0] = A == `penguin;
  assign $v8[1] = B == `bird;
  wire [1:0] $v9;
  assign $v9[0] = A == `reindeer;
  assign $v9[1] = B == `herbivore;
  assign Valid = &$v1 | &$v2 | &$v3 | &$v4 | &$v5 | &$v6 | &$v7 | &$v8 | &$v9;
endmodule

// Define ancestor1(atom, atom).
module \ancestor1/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  wire $v1;
  \hasproperty/3 \hasproperty_dlkXi/3 (B, `sonOf, A, $v1);
  assign Valid = &$v1;
endmodule

// Define ancestor3(atom, atom).
module \ancestor3/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  (* keep *) wire [5:0] C;
  wire [1:0] $v1;
  \ancestor2/2 \ancestor2_MpDSM/2 (A, C, $v1[0]);
  \hasproperty/3 \hasproperty_RXYIu/3 (B, `sonOf, C, $v1[1]);
  assign Valid = &$v1;
endmodule

// Define ancestor8(atom, atom).
module \ancestor8/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  (* keep *) wire [5:0] C;
  wire [1:0] $v1;
  \ancestor7/2 \ancestor7_tmKfj/2 (A, C, $v1[0]);
  \hasproperty/3 \hasproperty_nqdBC/3 (B, `sonOf, C, $v1[1]);
  assign Valid = &$v1;
endmodule

// Define hasProperty(atom, atom, atom).
module \hasProperty/3 (A, B, C, Valid);
  input [5:0] A;
  input [5:0] B;
  input [5:0] C;
  output Valid;
  wire $v1;
  \hasproperty/3 \hasproperty_uZLYD/3 (A, B, C, $v1);
  wire [1:0] $v2;
  assign $v2[0] = B == `ancestor;
  \ancestor_unfold/2 \ancestor_unfold_XSksa/2 (A, C, $v2[1]);
  assign Valid = &$v1 | &$v2;
endmodule

// Define isNotA(atom, atom).
module \isNotA/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  (* keep *) wire [5:0] C;
  wire [1:0] $v1;
  \disjointClasses/2 \disjointClasses_DmhMw/2 (B, C, $v1[0]);
  \isA/2 \isA_OUGST/2 (A, C, $v1[1]);
  assign Valid = &$v1;
endmodule

// Define error(atom, atom, atom).
module \error/3 (A, B, C, Valid);
  input [5:0] A;
  input [5:0] B;
  input [5:0] C;
  output Valid;
  wire [2:0] $v1;
  \isA/2 \isA_rxpPD/2 (A, B, $v1[0]);
  \isNotA/2 \isNotA_QFimo/2 (A, B, $v1[1]);
  assign $v1[2] = C == `Individual_X_cannot_belong_and_not_belong_to_class_Y;
  assign Valid = &$v1;
endmodule

// Define ancestor7(atom, atom).
module \ancestor7/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  (* keep *) wire [5:0] C;
  wire [1:0] $v1;
  \ancestor6/2 \ancestor6_XTNwu/2 (A, C, $v1[0]);
  \hasproperty/3 \hasproperty_FMbAV/3 (B, `sonOf, C, $v1[1]);
  assign Valid = &$v1;
endmodule

// Define ancestor6(atom, atom).
module \ancestor6/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  (* keep *) wire [5:0] C;
  wire [1:0] $v1;
  \ancestor5/2 \ancestor5_BrbZw/2 (A, C, $v1[0]);
  \hasproperty/3 \hasproperty_vFIpE/3 (B, `sonOf, C, $v1[1]);
  assign Valid = &$v1;
endmodule

// Define isA(atom, atom).
module \isA/2 (A, B, Valid);
  input [5:0] A;
  input [5:0] B;
  output Valid;
  wire $v1;
  \isa/2 \isa_xDvYS/2 (A, B, $v1);
  (* keep *) wire [5:0] E;
  wire [1:0] $v2;
  \isa/2 \isa_osGLe/2 (A, E, $v2[0]);
  \subClass/2 \subClass_FYlpa/2 (E, B, $v2[1]);
  (* keep *) wire [5:0] J;
  wire [1:0] $v3;
  assign $v3[0] = B == `carnivore;
  \hasproperty/3 \hasproperty_SHOqN/3 (A, `hunt, J, $v3[1]);
  (* keep *) wire [5:0] T;
  wire [1:0] $v4;
  assign $v4[0] = B == `predator;
  \hasproperty/3 \hasproperty_KTJPu/3 (A, `hunt, T, $v4[1]);
  (* keep *) wire [5:0] AN;
  wire [1:0] $v5;
  assign $v5[0] = B == `prey;
  \hasproperty/3 \hasproperty_dGFaf/3 (AN, `hunt, A, $v5[1]);
  assign Valid = &$v1 | &$v2 | &$v3 | &$v4 | &$v5;
endmodule
