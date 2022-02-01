su
systemctl start NetworkManager.service
systemctl enable NetworkManager.service
ip link
ip link set edit up
nmcli dev wifi connect MIFI_2G_kj7J password sfV6mxne
pacman -S xorg-server xorg-xinit sddm xf86-video-nouveau plasma