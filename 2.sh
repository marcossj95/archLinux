rm /etc/localtime
ln -s /usr/share/zoneinfo/Europe/Madrid /etc/localtime
echo LANG=es_ES.UTF-8 > /etc/locale.conf
echo MarcosPC > /etc/hostname
echo "KEYMAP=es" > /etc/vconsole.conf
echo -e "127.0.0.1    localhost.localdomain    localhost \n::1        localhost.localdomain      localhost \n127.0.0.1    MarcosPC.localdomain     MarcosPC" > /etc/hosts
hwclock --systohc