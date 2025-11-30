Result of

`QA-Prolog --verbose --qmasm-args="--solver=tabu --postproc=opt" --query="mult(A, B,  6)." --work-dir="/home/dadi/Thesis/Code/2_QA-prolog/3_QA-prolog/factorization/work" factorization.pl`

---
```text
QA-Prolog: INFO: Parsing factorization.pl as Prolog code
QA-Prolog: INFO: Representing symbols with 1 bit(s) and integers with 3 bit(s)
QA-Prolog: INFO: Storing intermediate files in /home/dadi/Thesis/Code/2_QA-prolog/3_QA-prolog/factorization/work
QA-Prolog: INFO: Writing Verilog code to factorization.v
QA-Prolog: INFO: Writing a Yosys synthesis script to factorization.ys
QA-Prolog: INFO: Converting Verilog code to an EDIF netlist
QA-Prolog: INFO: Executing yosys -q -s factorization.ys -b edif -o factorization.edif factorization.v
QA-Prolog: INFO: Converting the EDIF netlist to QMASM code
QA-Prolog: INFO: Executing edif2qmasm -o factorization.qmasm factorization.edif
QA-Prolog: INFO: Executing qmasm --run --values=ints --solver=tabu --postproc=opt --pin=Query.Valid := true factorization.qmasm
A = 0
B = 0

A = 0
B = 1

A = 0
B = 2

A = 0
B = 3

A = 0
B = 4

A = 0
B = 5

A = 0
B = 6

A = 0
B = 7

A = 1
B = 0

A = 1
B = 1

A = 1
B = 2

A = 1
B = 3

A = 1
B = 4

A = 1
B = 5

A = 1
B = 6

A = 1
B = 7

A = 2
B = 0

A = 2
B = 1

A = 2
B = 2

A = 2
B = 3

A = 3
B = 0

A = 3
B = 1

A = 3
B = 2

A = 3
B = 3

A = 4
B = 0

A = 4
B = 1

A = 4
B = 6

A = 4
B = 7

A = 5
B = 0

A = 5
B = 1

A = 5
B = 6

A = 5
B = 7

A = 6
B = 0

A = 6
B = 1

A = 6
B = 4

A = 6
B = 5

A = 7
B = 0

A = 7
B = 1

A = 7
B = 4

A = 7
B = 5
```