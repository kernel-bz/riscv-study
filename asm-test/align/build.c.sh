riscv64-unknown-linux-gnu-gcc $1.c -S
riscv64-unknown-linux-gnu-gcc $1.c -c -o $1.o
riscv64-unknown-linux-gnu-objdump -d $1.o
riscv64-unknown-linux-gnu-objdump -d $1.o > $1.dump
riscv64-unknown-linux-gnu-objdump -x $1.o > $1.map

