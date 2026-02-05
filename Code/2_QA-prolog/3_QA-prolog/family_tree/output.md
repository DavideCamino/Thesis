Result of

`QA-Prolog --verbose --qmasm-args="--solver=tabu --postproc=opt" --query='friends(P1, P2).' --work-dir="/home/dadi/Thesis/Code/2_QA-prolog/3_QA-prolog/friends/work" friends.pl`

---
```text
QA-Prolog: INFO: Parsing friends.pl as Prolog code
QA-Prolog: INFO: Representing symbols with 3 bit(s) and integers with 1 bit(s)
QA-Prolog: INFO: Storing intermediate files in /home/dadi/Thesis/Code/2_QA-prolog/3_QA-prolog/friends/work
QA-Prolog: INFO: Writing Verilog code to friends.v
QA-Prolog: INFO: Writing a Yosys synthesis script to friends.ys
QA-Prolog: INFO: Converting Verilog code to an EDIF netlist
QA-Prolog: INFO: Executing yosys -q -s friends.ys -b edif -o friends.edif friends.v
QA-Prolog: INFO: Converting the EDIF netlist to QMASM code
QA-Prolog: INFO: Executing edif2qmasm -o friends.qmasm friends.edif
QA-Prolog: INFO: Executing qmasm --run --values=ints --solver=tabu --postproc=opt --pin=Query.Valid := true friends.qmasm
P1 = alice
P2 = charlie

P1 = charlie
P2 = alice
```