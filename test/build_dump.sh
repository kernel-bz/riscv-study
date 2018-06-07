#64bits:
#riscv64-unknown-elf-gcc -o xlen64 xlen.c -march=rv64imac -mabi=lp64 --save-temps
#32bits:
#riscv64-unknown-elf-gcc -o xlen32 xlen.c -march=rv32imac -mabi=ilp32 --save-temps

riscv64-unknown-elf-gcc -o mult_test01 mult_test01.c --save-temps
riscv64-unknown-elf-objdump -d -t -r mult_test01
