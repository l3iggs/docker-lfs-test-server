FROM l3iggs/archlinux-aur
MAINTAINER l3iggs <l3iggs@live.com>

# upldate master package list
RUN sudo pacman -Sy

# install lfs-test-server
RUN yaourt -S --needed --noconfirm git-lfs-test-server-git

# regenerate new ssl cert on every run
ENV REGENERATE_SSL_CERT true

# start server
ADD run.sh /root/run.sh
CMD ["sudo","-E","bash","/root/run.sh"]
