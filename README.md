# gentoo-x220

Kernel config notes:
- FUSE support built-in
- No bluetooth
- No sound card support
- Only support for VFAT/ext4
- USB 2.0 support only
- No initramfs and no modules; everything is built directly into the kernel

Todo:
- [ ] Flash coreboot
- [ ] Switch to systemd-boot from GRUB
