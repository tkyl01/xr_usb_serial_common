obj-m := xr_usb_serial_common.o
KERNELDIR = /home/nkj/10Gdisk/openwrt/build_dir/target-mips_34kc_uClibc-0.9.33.2/linux-ar71xx_generic/linux-3.18.80/
PWD       = $(shell pwd)
TOOLCHAIN = "/home/nkj/10Gdisk/openwrt/staging_dir/toolchain-mips_34kc_gcc-4.8-linaro_uClibc-0.9.33.2/bin/mips-openwrt-linux-"

ccflags-y	:= -DDEBUG=0

all:
	make -C $(KERNELDIR) ARCH=mips CROSS_COMPILE=$(TOOLCHAIN) M=$(PWD) modules

modules_install:
	$(MAKE) -C $(KERNELDIR) M=$(PWD) modules_install

clean:
	rm -rf *.o *~ core .depend .*.cmd *.ko *.mod.c .tmp_versions vtty
