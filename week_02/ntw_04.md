------4 -------

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
5. Divide the result of step 1 by 2 and not the remainder.
6. Continue until the division is 0.
7. Combine all the remainders from right to left.

## Key-terms
- **Binary**:  a numeral system used in mathematics and computer science to represent numbers and data.
- **Hex**: 

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
|---|---|---|

## Assignment 2



## Assignment 3


