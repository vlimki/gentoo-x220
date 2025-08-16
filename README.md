# gentoo-x220

I am running a dual-kernel setup (`config/linux-\*-x220` and `config/linux-\*-desktop`). The X220 kernel is optimized and tries to be minimal, whereas the desktop kernel is just a stock configuration for now. I use my desktop for compiling packages, which is why I have `-O3` and `-flto` set in `make.conf`.

Kernel config notes:
- No bluetooth
- No sound card support
- Only support for VFAT/ext4
- USB 2.0 support only
- No initramfs and no modules; everything is built directly into the kernel

Todo:
- [ ] Flash coreboot
- [x] Switch to systemd-boot from GRUB
