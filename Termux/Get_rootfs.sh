#!/bin/bash
read -p "Do you want to create symbolic link for proot rootfs? (yes/no): " answer
if [ "$answer" = "yes" ]; then
    ln -s $PREFIX/var/lib/proot-distro/installed-rootfs $HOME/proot-distro-rootfs
    echo "Symbolic link created."
 else
    echo "Ok"
fi

read -p "Do you want to create symbolic link for proot udroid? (yes/no): " answer
if [ "$answer" = "yes" ]; then
    ln -s $PREFIX/var/lib/udroid/installed-filesystems $HOME/udroid-rootfs 
    echo "Symbolic link created."
 else
    echo "Ok"
fi
