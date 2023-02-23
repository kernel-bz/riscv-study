#CONFIG_MODULE_SIG=n
#CONFIG_MODULE_SIG_ALL=n

obj-m := hello.o
VER := v6.1
ARCH := riscv
ARCC := riscv64-unknown-linux-gnu-
KDIR := /home/risc-v/kernel/build/build-$(VER)-riscv-origin

MRUN := $(MAKE) ARCH=$(ARCH) CROSS_COMPILE=$(ARCC)

all: modules
modules:
	$(MRUN) -C $(KDIR) M=${shell pwd} modules

clean:
	$(MRUN) -C $(KDIR) M=${shell pwd} clean
