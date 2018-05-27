#64bits:
riscv64-unknown-elf-gcc -o xlen64 xlen.c -march=rv64imac -mabi=lp64 --save-temps
#32bits:
riscv64-unknown-elf-gcc -o xlen32 xlen.c -march=rv32imac -mabi=ilp32 --save-temps
