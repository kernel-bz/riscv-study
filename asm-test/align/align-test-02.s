#
# refer: https://github.com/riscv-collab/riscv-gnu-toolchain/issues/171
# riscv64-unknown-linux-gnu-gcc test.s -c -o test.o
# riscv64-unknown-linux-gnu-objdump -d test.o
#
.text

align_1:
        .align 1
        addi x0,x0,1
        addi x0,x0,2
        .align 1
        addi x0,x0,3
        addi x0,x0,4

align_2:
        .align 2
        addi x0,x0,1
        addi x0,x0,2
        .align 2
        addi x0,x0,3
        addi x0,x0,4

align_3:
        .align 3
        addi x0,x0,1
        addi x0,x0,2
        .align 3
        addi x0,x0,3
        addi x0,x0,4

align_4:
        .align 4
        addi x0,x0,1
        addi x0,x0,2
        .align 4
        addi x0,x0,3
        addi x0,x0,4
