# --- Kernel---
rm kernel/*

cp /usr/src/linux-6.15.8-exp/.config kernel/linux-6.15.8-exp
cp /usr/src/linux-6.15.8-desktop/.config kernel/linux-6.15.8-desktop
cp /usr/src/linux-6.15.8-x220/.config kernel/linux-6.15.8-x220

# --- Dotfiles ---
rm .config/* -rf

mkdir .config/fish
cp -r ~/.config/nvim .config
cp ~/.config/fish/config.fish .config/fish

# --- Portage ---
rm portage/* -rf

cp /etc/portage/package.env /etc/portage/env/ /etc/portage/package.use/ /etc/portage/package.mask/ /etc/portage/make.conf /etc/portage/savedconfig/ /var/lib/portage/world portage/ -r
