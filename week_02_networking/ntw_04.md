# Counting in Binary and Hex
In binary numbers are represented with bits (binary digit), represented by either a 1 or a 0 and is the basis for all computer and digital system. This is what is called a base-2 system. The decimal system is called a base-10 system because the numbering ranges from 0 to 9.

In order to convert binary to decimal you can use this formula:

D = x<sub>n</sub> * b<sup>n</sup> + x<sub>n-1</sub> * b<sup>n-1</sup> + ...

D = Decimal

x = digit value

b = base value

Example: 1000 = 1 x 2<sup>3</sup> + 0 x 2<sup>2</sup> + 0 x 2<sup>1</sup> + 0 x 2<sup>0</sup>

This table shows 8-bit (byte) binary numbers and their corresponding decimal value:

| Bit position | Decimal Value | Binary to decimal calculation|
|---|---|---|
|1|1|2<sup>0</sup>|
|2|2|2<sup>1</sup>|
|3|4|2<sup>2</sup>|
|4|8|2<sup>3</sup>|
|5|16|2<sup>4</sup>|
|6|32|2<sup>5</sup>|
|7|64|2<sup>6</sup>|
|8|128|2<sup>7</sup>|

To convert decimal to binary, you can use the remainder method:

1. Divide by 2.
2. Note the remainder. This will be 0 or 1.
3. Divide the result of step 1 by 2 and note the remainder.
4. Continue until the division is 0.
5. Combine all the remainders from right to left.

Hexadecimal is a base-16 numeral system, meaning it uses 16 distinct symbols to represent values. In this case that's the numbers 0 to 9 and the letters A to F. These symbols correspond to the following values:

| Decimal | Hexadecimal |
|---|---|
|0|0|
|1|1|
|2|4|
|3|3|
|4|4|
|5|5|
|6|6|
|7|7|
|8|8|
|9|9|
|10|A|
|11|B|
|12|C|
|13|D|
|14|E|
|15|F|

We can use the same remainder method used for the decimal to binary conversion, but instead we divide by 16 rather than 2 since this is a base-16 system:

1. Divide by 2.
2. Note the remainder.
3. Divide the result of step 1 by 16 and note the remainder.
4. Continue until the division is 0.
5. Replace the remainders with the hexadecimal values from the table above.
6. Combine all the remainders from right to left.

Converting hexadecimal to decimal can be done again using a formula similar to the one we used for binary to decimal:

D = x<sub>n-1</sub> * 16<sup>r-1</sup> + ... + x<sub>2</sub> * 16<sup>2</sup> + x<sub>1</sub> * 16<sup>1</sup> + x<sub>0</sub> * 16<sup>0</sup>

## Key-terms
- **Binary**: a numeral base-2 system used in mathematics and computer science to represent numbers and data.
- **Hexadecimal**: a numeral base-16 system used in mathematics and computer science to represent numbers and data.

## Assignments

### Assignment 1
- [x] Translate the following decimal numbers into binary: 16, 128, 228, 112, 73

### Assignment 2
- [x] Translate the following binary numbers into decimal: 1010 1010, 1111 0000, 1101 1011, 1010 0000, 0011 1010

### Assignment 3
- [x] Translate the following decimal numbers into hexadecimal: 15, 37, 246, 125, 209

### Assignment 4
- [x] Translate the following hexadecimal numbers into decimal: 88, e0, cb, 2f, d8

### Sources
- [What is binary?](https://www.techtarget.com/whatis/definition/binary)
- [Binary to Decimal Conversion](https://www.electronics-tutorials.ws/binary/bin_2.html)
- [RapidTables](https://www.rapidtables.com/convert/number/decimal-to-binary.html)
- [ASCII, decimal, hexadecimal, octal, and binary conversion table](https://www.ibm.com/docs/en/aix/7.2?topic=adapters-ascii-decimal-hexadecimal-octal-binary-conversion-table)
- [Base N to decimal converters](https://madformath.com/calculators/basic-math/base-converters/decimal-to-hexadecimal-converter-with-steps/decimal-to-hexadecimal-converter-with-steps)
- [Hexadecimal to Decimal](https://www.cuemath.com/numbers/hexadecimal-to-decimal/)

### Problems
No problems.

### Result

## Assignment 1

| Decimal | Calculation | Binary |
|---|---|---|
|16|16/2=8 R0, 8/2=4 R0, 4/2=2 R0, 2/2=1 R0, 1/2=0 R1|10000|
|128|128/2=64 R0, 64/2=32 R0, 32/2=16 R0, 16/2=8 R0, 8/2=4 R0, 4/2=2 R0, 2/2=1 R0, 1/2=0 R1|1000000|
|228|228/2=114 R0, 114/2=57 R0, 57/2=28 R1, 28/2=14 R0, 14/2=7 R0, 7/2=3 R1, 3/2=1 R1, 1/2=0 R1|11100100|
|112|112/2=56 R0, 56/2=28 R0, 28/2=14 R0, 14/2=7 R0, 7/2=3 R1, 3/2=1 R1, 1/2=0 R1|1110000|
|73|73/2=36 R1, 36/2=18 R0, 18/2=9 R0, 9/2=4 R1, 4/2=2 R0, 2/2=1 R0, 1/2=0 R1|1001001|

## Assignment 2

| Binary | Calculation | Decimal |
|---|---|---|
|1010 1010|128+32+8+2|170|
|1111 0000|128+64+32+16|240|
|1101 1011|128+64+16+8+2+1|219|
|1010 0000|128+32|160|
|0011 1010|32+16+8+2|58|

## Assignment 3

| Decimal | Calculation | Hexadecimal |
|---|---|---|
|15|15/16=0 R15|F|
|37|37/16=2 R5, 2/16=0 R2|25|
|246|128+64+16+8+2+1|219|
|125|128+32|160|
|209|32+16+8+2|58|

## Assignment 4

| Hexadecimal | Calculation | Decimal |
|---|---|---|
|88|8x16 + 8x1|136|
|e0|14x16 + 0x1|224|
|cb|12x16 + 11x1|203|
|2f|2x16 + 15x1|47|
|d8|13x16 + 8x1|216|