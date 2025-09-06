# gentoo-x220

I am running a dual-kernel setup (`config/linux-*-x220` and `config/linux-*-desktop`). The X220 kernel is optimized and tries to be minimal, whereas the desktop kernel is just a stock configuration for occasioal desktop usage (i.e., package compilation). The X200 kernel is optimized and works on the X220 as well.

## Features

- Fast: <10s boot on an SSD
- Minimal: 88MB of RAM usage with X11 (`dwm`) and WiFi (`wpa_supplicant`), fits in a couple GB of disk space

## Kernel config notes

- X220 is UEFI-only; X200 is BIOS-only
- LUKS support
- No bluetooth support
- No touchpad support, trackpoint only
- No sound card support
- Only support for VFAT/ext4
- USB 2.0 support only (the X220 has no USB 3.0 ports anyway)
- No initramfs and no modules; everything is built directly into the kernel

## TODO

- [ ] Flash coreboot/libreboot
- [x] Switch to systemd-boot from GRUB
