FROM l3iggs/archlinux-aur
MAINTAINER l3iggs <l3iggs@live.com>

# upldate master package list
RUN sudo pacman -Sy

# install lfs-test-server
RUN sudo pacman -S --needed --noconfirm git-lfs-test-server-git
