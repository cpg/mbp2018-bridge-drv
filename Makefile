obj-m += bce.o
bce-objs := pci.o mailbox.o queue.o queue_dma.o vhci/vhci.o vhci/queue.o vhci/transfer.o audio/audio.o audio/protocol.o audio/protocol_bce.o audio/pcm.o

MY_CFLAGS += -DWITHOUT_NVME_PATCH
#MY_CFLAGS += -g -DDEBUG
ccflags-y += ${MY_CFLAGS}
CC += ${MY_CFLAGS}

all:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules

install:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) modules_install

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(shell pwd) clean
