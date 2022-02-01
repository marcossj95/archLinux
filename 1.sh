pacstrap /mnt base linux linux-firmware nano networkmanager dhcpcd netctl wpa_supplicant dialog
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt /bin/bash