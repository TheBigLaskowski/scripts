#!/bin/bash
sudo cryptsetup luksOpen /dev/nvme1n1p3 cryptroot
sudo mount /dev/mapper/cryptroot /mnt -t btrfs -o subvol=root
sudo mount /dev/mapper/cryptroot /mnt/home -t btrfs -o subvol=home
sudo mount /dev/nvme1n1p2 /mnt/boot
sudo mount /dev/nvme1n1p1 /mnt/boot/efi
sudo mount --bind /dev /mnt/dev
sudo mount -t proc /proc /mnt/proc
sudo mount -t sysfs /sys /mnt/sys
sudo mount -t tmpfs tmpfs /mnt/run
sudo mkdir -p /mnt/run/systemd/resolve/
sudo chroot /mnt