Step 1
I made the assembly file with: riscv32-unknown-elf-gcc -S GCD.c -o GCD.S It has the assembly code of GCD and main. For example, "rem a5,a4,a5" is the % in my code and "call GCD" is the  function calling itself.

Compared to objdump from Exercise 1:
GCD.S is easier to read. It has names like GCD, main and .L2, and extra lines that start with a dot. objdump shows addresses and the machine code in numbers next to each instruction. It also has all the library code. The instructions are almost the same in both.

Step 2
I ran: riscv32-unknown-elf-as GCD.S -o GCD.o This made an object file. It has my code in machine code, but it cannot run yet because the startup code and printf are missing.

Step 3
I ran: riscv32-unknown-elf-ld GCD.o It gave errors because it could not find _start and printf. The ld command alone does not know where these files are. The longer ld command also gave errors, so I used the last command from the homework: riscv32-unknown-elf-gcc GCD.o -o GCD This worked and made the executable GCD. gcc knows where the files are.

Step 4
Command: spike --isa=rv32imafdc_zicsr_zifencei pk GCD Output: 6 The program printed 6, which is the GCD of 48 and 18. The proxy kernel (pk) helps Spike run the program and print to the screen. I used a longer --isa than rv32i because my program and pk have more instructions than rv32i. With rv32i it got stuck.

Step 5
I used the Spike log (-l --log-commits) to see each instruction. I saved the part for main and GCD in step5_log_excerpt.txt.

First instructions of main:
addi sp,-32: sp went from 0x7ffffda0 to 0x7ffffd80. This makes space on the stack.
sw ra,28(sp): the return address 0x0001019e was saved in memory.
sw s0,24(sp): the old s0 was saved in memory.
addi s0,sp,32: s0 became 0x7ffffda0.

Then main loads 48 and 18 and calls GCD. The rem instruction (address 0x00010106) ran 3 times. The result in a5 was 0x0c (12), then 0x06 (6), then 0x00 (0). It matches: 48 % 18 = 12, 18 % 12 = 6, 12 % 6 = 0. When b is 0, GCD returns 6 in a0.
In short, addi, mv, lw and rem change a register, sw changes memory, and call, bne and ret change which instruction runs next.