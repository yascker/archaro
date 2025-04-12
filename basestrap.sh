#!/bin/bash

# Script to install Arch Linux with stable Manjaro repositories

# 1. Replace Arch repositories with Manjaro ones in the installer
echo -e "\n\033[1;34mReplacing Arch repositories with Manjaro ones in /etc/pacman.d/mirrorlist...\033[0m"
cat <<EOL > /etc/pacman.d/mirrorlist
## Country : United_States
Server = https://coresite.mm.fcix.net/manjaro/stable/\$repo/\$arch
Server = https://mirror.us.leaseweb.net/manjaro/stable/\$repo/\$arch
Server = https://manjaro.moson.eu/stable/\$repo/\$arch
EOL

# 2. Replace keyring files
echo -e "\n\033[1;34mDownloading Manjaro keyring files...\033[0m"
curl -o /usr/share/pacman/keyrings/manjaro.gpg https://gitlab.manjaro.org/packages/core/manjaro-keyring/-/raw/master/manjaro.gpg
curl -o /usr/share/pacman/keyrings/manjaro-trusted https://gitlab.manjaro.org/packages/core/manjaro-keyring/-/raw/master/manjaro-trusted
curl -o /usr/share/pacman/keyrings/manjaro-revoked https://gitlab.manjaro.org/packages/core/manjaro-keyring/-/raw/master/manjaro-revoked

# 3. Update signatures
echo -e "\n\033[1;34mUpdating signatures...\033[0m"
pacman-key --init
pacman-key --populate archlinux manjaro

# 4. Remove conflicting dependencies
echo -e "\e[35mRemoving conflicting dependencies\e[0m"
pacman -Rdd pacman-mirrorlist --noconfirm
# 4.1. Create a new mirrorlist
touch /etc/pacman.d/mirrorlist

# 5. Replace Arch repositories with Manjaro ones in the installer
echo -e "\n\033[1;34mReplacing Arch repositories with Manjaro ones in /etc/pacman.d/mirrorlist...\033[0m"
cat <<EOL > /etc/pacman.d/mirrorlist
## Country : United_States
Server = https://coresite.mm.fcix.net/manjaro/stable/\$repo/\$arch
Server = https://mirror.us.leaseweb.net/manjaro/stable/\$repo/\$arch
Server = https://manjaro.moson.eu/stable/\$repo/\$arch
EOL

# 6. Remove conflicting dependencies
pacman -Rdd reflector --noconfirm

# 7. Install manjaro-tool-base (to have basestrap)
echo -e "\n\033[1;34mInstalling manjaro-tool-base-git...\033[0m"
pacman -Syy manjaro-tools-base-git --noconfirm

# 8. Install the base system in /mnt
echo -e "\n\033[1;34mInstalling the base system in /mnt...\033[0m"
basestrap /mnt

if [ $? -eq 0 ]; then
    echo -e "\n\033[1;32mProcess completed.\033[0m"
else
    echo -e "\n\033[1;31mSomething went wrong with the base installation.\033[0m"
fi
