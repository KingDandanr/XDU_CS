CC=gcc
CFLAGS=-std=c11

ifneq  ($(KERNELRELEASE),)
obj-m:=edu_dev.o
else
KDIR := /lib/modules/$(shell uname -r)/build
PWD:=$(shell pwd)

all:
	make -C $(KDIR) M=$(PWD) modules

clean:
	rm -f *.ko *.o *.symvers *.cmd *.cmd.o .*.cmd *.mod *.mod.c *.order

install:
	make -C $(KDIR) M=$(PWD) modules
	sudo insmod edu_dev.ko
	sudo mknod /dev/edu c 200 200 

uninstall:
	sudo rmmod edu_dev
	sudo rm -rf /dev/edu

endif