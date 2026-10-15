Step 3
The output of cat GCD looks like random symbols. This is because GCD is not a text file. It is made of machine code that the computer understands, but people cannot read. Only a few words are readable, like main and GCD.

Step 4
The file command says GCD is a 32-bit RISC-V program. It also says the library code is already inside the file, and the function names are still kept in it.

Step 5
readelf shows what is inside the program file. It shows the start address of the program, the parts of the file (.text has the code, .data has the variables), and a list of names like main and GCD with their addresses.

Step 6
objdump changes the machine code back into assembly code that we can read. Each line shows an address, the machine code and the instruction. In the GCD part we can see rem (the % in our code) and jal (the function calling itself). I saved the assembly of GCD and main in GCD.S.

Step 7
Error: "Access exception occurred while loading payload GCD: Memory address 0x10000 is invalid". The program wants to start at address 0x10000, but the memory in Spike starts at 0x80000000. So Spike cannot put the program in memory and it stops.

Step 8
Output: 6
The proxy kernel (pk) helps Spike run the program, for example by printingto the screen. So the program ran fine and printed 6, which is the rightanswer. I used isa=rv32imafdc_zicsr_zifencei instead of rv32i, because the program was built with more instructions than rv32i has. With rv32i it got stuck.