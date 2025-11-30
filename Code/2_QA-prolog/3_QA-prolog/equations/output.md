Result of

`QA-Prolog --verbose --qmasm-args="--solver=tabu --postproc=opt" --query='fours(B, A).' --work-dir="/home/dadi/Thesis/Code/2_QA-prolog/3_QA-prolog/equations/work" equations.pl`

---
```text
QA-Prolog: INFO: Parsing equations.pl as Prolog code
QA-Prolog: INFO: Representing symbols with 1 bit(s) and integers with 3 bit(s)
QA-Prolog: INFO: Storing intermediate files in /home/dadi/Thesis/Code/2_QA-prolog/3_QA-prolog/equations/work
QA-Prolog: INFO: Writing Verilog code to equations.v
QA-Prolog: INFO: Writing a Yosys synthesis script to equations.ys
QA-Prolog: INFO: Converting Verilog code to an EDIF netlist
QA-Prolog: INFO: Executing yosys -q -s equations.ys -b edif -o equations.edif equations.v
QA-Prolog: INFO: Converting the EDIF netlist to QMASM code
QA-Prolog: INFO: Executing edif2qmasm -o equations.qmasm equations.edif
QA-Prolog: INFO: Executing qmasm --run --values=ints --solver=tabu --postproc=opt --pin=Query.Valid := true equations.qmasm
A = 2
B = 2

A = 3
B = 3
```