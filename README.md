# gentoo-x220

I am running a dual-kernel setup (`config/linux-*-x220` and `config/linux-*-desktop`). The X220 kernel is optimized and tries to be minimal, whereas the desktop kernel is just a stock configuration for now. I use my desktop for compiling packages, which is why I have `-O3` and `-flto` set in `make.conf`.

There is also an experimental configuration file (`config/linux-*-exp`) right now I use for aggressive trimming.

## Features

- Fast: <10s boot on an SSD
- Minimal: 88MB of RAM usage with X11 (`dwm`) and WiFi (`wpa_supplicant`), fits in a couple GB of disk space

## Kernel config notes

- No bluetooth support
- No touchpad support, trackpoint only
- No sound card support
- Only support for VFAT/ext4
- USB 2.0 support only (the X220 has no USB 3.0 ports anyway)
- No initramfs and no modules; everything is built directly into the kernel

## TODO

- [ ] Flash coreboot
- [x] Switch to systemd-boot from GRUB
