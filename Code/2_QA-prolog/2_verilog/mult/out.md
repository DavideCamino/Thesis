Verilog program:

```verilog
module mult (multiplicand, multiplier, product);
   input [1:0] multiplicand;
   input [1:0] multiplier;
   output[2:0] product;

   assign product = multiplicand * multiplier;
endmodule
```

Result of:

`qmasm --run --pin="mult.product[2:0] := 110" --solver="tabu" mult.qmasm`

---

```text
# mult.multiplicand[0] -->   24
# mult.multiplicand[1] -->   23
# mult.multiplier[0] -->   26
# mult.multiplier[1] -->   25
# mult.product[0] --> [False]
# mult.product[1] --> [True]
# mult.product[2] --> [True]
Solution #1 (energy = -57.5000, tally = 299):

    Variable              Value
    --------------------  -----
    mult.multiplicand[0]  False
    mult.multiplicand[1]  True
    mult.multiplier[0]    True
    mult.multiplier[1]    True
    mult.product[0]       False
    mult.product[1]       True
    mult.product[2]       True

Solution #2 (energy = -57.5000, tally = 100):

    Variable              Value
    --------------------  -----
    mult.multiplicand[0]  True
    mult.multiplicand[1]  True
    mult.multiplier[0]    False
    mult.multiplier[1]    True
    mult.product[0]       False
    mult.product[1]       True
    mult.product[2]       True
```

Solution 1:
* multiplicand = 10 = 2
* multiplier = 11 = 3
* multiplier = 110 = 6

Solution 2:
* multiplicand = 11 = 3
* multiplier = 10 = 2
* multiplier = 110 = 6