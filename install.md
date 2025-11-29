# Arch Install Commands

## Wifi

```
// show all network interfaces
ip addr show / ip a
```

### Connect to wifi

```
// start iwctl shell
iwctl
```

[inside the iwctl shell]

```
// list all available wifi interfaces
device list

// use wifi interface to scan for available networks and list them
station [interface name] scan
station [interface name] get-networks

// connect to network
station [interface name] connect "[network name]"

// exit iwctl shell
ctrl-D
```

#### Check connection

```
// check for ip address on wireless interface
ip a

// check connection to internet
ping archlinux.org
```

## Partitioning

### Determine the installation target

```
// concise view of block devices
lsblk

// verbose description of each device
// prints more info such as brand name
// easier for determining the correct device
fdisk -l
```

### Wipe the drive

if the disk is not empty, use gdisk to erase it

```
// open the gdisk shell
gdisk /dev/[device name eg. sda]
```

[inside the gdisk shell]

```
// add extra option including zap
x

// zap drive, complete wipe
z
y
y
```

### Partition the drive

```
// start the cfdisk shell
cfdisk /dev/[device name eg. sda]

// choose gpt for partition table type
```

[inside the cfdisk shell]

#### Create boot partition
```
// select new to add efi partition
enter

// enter size
1024M

// select type and set type to EFI
enter
EFI system
```

#### Create swap partition

```
// select new to add swap partition
enter

// enter size
8192M

// select type and set type to EFI
enter
Linux swap
```

#### Create root partition

```
// select new to add swap partition
enter

// use the rest of the remaining space, or not. I don't care.
enter

// selct write to save the changes and confirm
enter
yes

// select quit to exit cfdisk
enter
```

## Formatting

### Format boot partition

```
// make the file system for partition 1
mkfs.fat -F32 /dev/[partition name eg. sda1]
```

### Format swap partition

```
// create swap on partition 2
mkswap /dev/[partition name eg. sda2]

//turn swap on
swapon /dev/[partition name]
```

### Format root partition

```
// make the file system
mkfs.ext4 /dev/[partition name eg. sda3]
```

### Mount

```
// mount root partition
mount /dev/[partition 3] /mnt
```

## Install

```
// install arch, linux, and any other packages needed
pacstrap -i /mnt base base-devel linux linux-headers linux-firmware vim tmux man

// make fstab
genfstab -U -p /mnt >> /mnt/etc/fstab

// chroot into the installation
arch-chroot /mnt
```

[inside the chroot shell]

### Networking

```
// install networking and wifi
pacman -S networkmanager iw

// enable networkmanager
systemctl enable NetworkManager
```

### Timezone

```
// update locale
vim /etc/locale.gen

// uncomment the lines start with en_US.UTF-8

// update locale
locale-gen
```

### User/Passwords

```
// set password for root user
passwd
[root password]
[root password]

// create my user account and set password
useradd -m -g users -G wheel,storage,power [username]
passwd [username]
[password]
[password]

// allow members of wheel group to use sudo
EDITOR=vim visudo

// uncomment line that says:
%wheel ALL=(ALL:ALL) ALL

// use root password to ulock sudo
Defaults rootpw
```

### 32 bit support

```
// enable 32 bit support
vim /etc/pacman.conf

// uncomment the line starting with [multilib], and the line below

// add 32 bit packages to package list
pacman -Syu
```

## Grub

```
// download grub and deps
pacman -S grub efibootmgr

// mount efi partition
mkdir /boot/EFI
mount /dev/[partition 1] /boot/EFI

// install grub to the efi partiont
grub-install --target=x86_64-efi --bootloader-id=grub_uefi --recheck

// generate grub config
grub-mkconfig -o /boot/grub/grub.cfg

// exit chroot
exit

// unmount everything
umount -a

// reboot the system
reboot
```

## Post Install

### Networking

```
// set hostname
hostnamectl set-hostname [hostname]

vim /etc/hosts

// add lines
127.0.0.1 localhost
127.0.1.1 [hostname]

// check hostname is set
hostnamectl

// check for available networks
nmcli device wifi list

// connect to the network
nmcli device wifi connect [network name] password [network password]

// check for a resolve address
vim /etc/resolv.conf

// if no resolve address, add:
nameserver 192.168.1.1
```

### Timezone

```
// set timezone
timedatectl set-timezone America/Los_Angeles
systemctl enable systemd-timesyncd
```

 ### Install microcode

```
pacman -S intel-ucode
```

## Workspace

### Install software

```
// essential software
pacman -S git xfce4 xfce4-screenshooter i3 dmenu alacritty zsh exa timeshift keepassxc android-file-transfer vscode spotify-launcher handbrake vlc blender gimp
alsa-utils alsa-lib lshw
 
<!-- pavucontrol pulseaudio pamixer playerctl -->
xorg-xrandr feh ttf-font-awesome bashtop cmatrix neofetch

// possible extra apps
pacman -S caja lxappearance

// install ohmyzsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

// install yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

// install yay packages
yay -S librewolf-bin brave-bin makemkv openrgb-bin i3lock-color yaru-gtk-theme yaru-icon-theme
```

### Start/enable cronie

```
// timeshift needs this service
systemctl start cronie
systemctl enable cronie
```

### Configure openrgb

```
// load necessary kernel module and chipset driver
sudo modprobe i2c-dev
sudo modprobe i2c-i801
```

### Setup config files

```
// install dotfiles
git clone https://github.com/danielxhogan/dotfiles.git

mkdir ~/.config/i3
ln -s ~/dotfiles/i3 ~/.config/i3/config

mkdir ~/.config/i3status
ln -s ~/dotfiles/i3status ~/.config/i3status/config

mkdir ~/.config/alacritty
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf

ln -s ~/dotfiles/picom.conf ~/.config/picom.conf

rm ~/.config/Code\ -\ OSS/User/settings.json
ln -s ~/dotfiles/vscode.json ~/.config/Code\ -\ OSS/User/settings.json
```

## Graphics

```
// get nvidia driver
pacman -S nvidia nvidia-settings nvidia-utils

// get xorg
pacman -S xorg-server xorg-xinit
```

### i3 standalone

```
// edit xinitrc to start i3
vim /etc/X11/xinit/xinitrc

// add line to end to start i3 when starx command is executed
exec i3

// to start i3
startx
```

### i3 inside of xfce

```
// start xfce
startxfce4

- open xfce4-settings-manager and go to xfce4-session-settings
- go to the Current Session tab
- find xfwm4, xfdesktop, and xfce4-panel
- set the restart style for all of them to none
- go to the Application Autostart tab
- click the add button and add an entry called i3 with the command i3
- open xfce-keyboard-settings
- go the Application Shortcut tab and delete all
```

### Set Font
```
Alacritty
  - inside alacritty.yml, under font section, uncomment normal, family, and style
  - make sure they all have the proper white space
  - set family to an existing font with no spaces
  - check for available fonts appearance settings or using fc-list ':' file
  - SourceCodePro is a good default

VSCode
  - open settings and search for font
  - under Editor: Font Family, change the first choice inside the quotes to an existing font with spaces
  - Source Code Pro is a good default

i3
  - find the i3bar section in i3 config file
  - edit the section after pango:
  - add an font family with or without spaces and optionally a style
```

## QEMU

### install

```
// install necesarry packages
pacman -S qemu virt-manager virt-viewer dnsmasq vde2 bridge-utils openbsd-netcat libguestfs qemu-hw-usb-host

// start and enable the libvirt service to use kvm
systemctl start libvirtd
systemctl enable libvirtd

// add permission for my user for kvm
vim /etc/libvirt/libvirtd.conf

// uncomment the following lines
unix_sock_group = "libvirt"
unix_sock_ro_perms = "0777"
unix_sock_rw_perms = "0770"

// add myself to the libvirt group
usermod -a -G libvirt $(whoami)

// activate the change
newgrp libvirt

// restart the service
systemctl restart libvirtd

// show status of networks
virsh net-list --all

// start the network
virsh net-start default

// set the network to autostart
virsh net-autostart default
```

### Mount WinGames

```
// install packages to mount windows ntfs drive with rw privelege
pacman -S fuse ntfs-3g

// mount the drive
mkdir /mnt/WinGames
mount -t ntfs-3g /dev/[partition name] /mnt/WinGames
```

### Creating a Windows vm

#### add file share

```
- when creating the new vm, before clicking finish, select the box that says 'Customize configuration before install'
- open the memory tab and check the box to enable shared memory
- click the button to add hardware and go to the filesystem tab
- make sure driver is set to virtiofs
- click browse and locate the file to share eg. /mnt/WinGames
- add a target path to name the drive inside the vm
```

#### add the virtio drivers

```
- add a hardware device with the virtio win drivers
- set the device type to CDROM
- start the installation
- when choosing drive to install Windows, click Load driver
- click ok on the popup and then uncheck Hide drivers
- choose the option for Windows 10/11
- click next
```

#### modify vm to recognize shared file

```
- start the vm and open a browser
- search for win fsp and download
- make sure to choose core in the installer

- search for virtio win fedora
- click stable-virtio and then choose virtio-win-guest-tools.exe
- make sure to choose Viofs in the installer
- after the installation is complete, reboot the vm

- open device manager and expand the system devices tab
- search for VirtIO FS Device
- make sure its recognized and driver is signed by redhat in driver details

- open start and search for services
- search for VirtIO-FS Service, right click, and press start
- right click and choose properties
- for startup type choose automatic
- once started, the shared file should be available in file explorer
```


### modify system for GPU pass through

- make sure intel vt-d is enabled in the bios
- make a backup before making any of the following changes
- mistakes in the two files edited below can cause the system not to boot

```
// get the ids of the gpu graphics and audio devices eg. 10de:1c82
lspci -nnk

// edit grub config
vim /etc/default/grub

// add parameters to the line starting with GRUB_CMDLINE_LINUX_DEFAULT:
intel_iommu=on iommu=pt vfio-pci.ids=[gpu device id],[gpu audio device id]

// regenerate grub config
grub-mkconfig -o /boot/grub/grub.cfg

// check for iommu capability
dmesg | grep -i -e DMAR -e IOMMU

// check iommu groups
// add the following code to a .sh file

#!/bin/bash
shopt -s nullglob
for g in $(find /sys/kernel/iommu_groups/* -maxdepth 0 -type d | sort -V); do
    echo "IOMMU Group ${g##*/}:"
    for d in $g/devices/*; do
        echo -e "\t$(lspci -nns ${d##*/})"
    done;
done;

// make file exeutable and run
chmod +x check-iommu.sh
./check-iommu.sh

// make change to grub config on demand
// for testing changes without persisting
// or fixing changes that caused the system not to boot

- reboot computer
- press e when grub screen displays
- find the line starting with linux and add the following:
  intel_iommu=on iommu=pt vfio-pci.ids=[gpu device id],[gpu audio device id]
-press ctrl-x to boot

// make gpu use vfio drivers on boot
vim /etc/modprobe.d/vfio.conf

// add the lines
options vfio-pci ids:[gpu device id],[gpu audio device id]
softdep nvidia pre: vfio-pci
softdep drm pre: vfio-pci

// remake initramfs
mkinitcpio -p linux
```
