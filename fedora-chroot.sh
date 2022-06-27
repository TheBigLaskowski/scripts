#!/bin/bash
lsblk
sudo cryptsetup luksOpen /dev/nvme1n1p3 cryptroot
lsblk
sudo mount /dev/mapper/cryptroot /mnt -t btrfs -o subvol=root
sudo mount /dev/mapper/cryptroot /mnt/home -t btrfs -o subvol=home
sudo mount /dev/nvme1n1p2 /mnt/boot
sudo mount /dev/nvme1n1p1 /mnt/boot/efi
mount --bind /dev /mnt/dev
sudo mount -t proc /proc /mnt/proc
sudo mount -t sysfs /sys /mnt/sys
sudo mount -t tmpfs tmpfs /mnt/run
sudo mkdir -p /mnt/run/systemd/resolve/
sudo chroot /mnt
touch /mnt/run/systemd/resolve/stub-resolv.conf
echo 'nameserver 1.1.1.1' > /mnt/run/systemd/resolve/stub-resolv.conf