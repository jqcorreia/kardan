
FROM phusion/baseimage:0.9.8
MAINTAINER	Rizo Isrof "rizo@odis.io"

# Set correct environment variables.
ENV HOME /root

# Regenerate SSH host keys. baseimage-docker does not contain any, so you
# have to do that yourself. You may also comment out this instruction; the
# init system will auto-generate one during boot.
RUN /etc/my_init.d/00_regen_ssh_host_keys.sh

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update
RUN	apt-get install -y -q curl libc6-dev gcc gcc-multilib xdg-utils

ENV DMD_DEB_URL http://downloads.dlang.org/releases/2014/dmd_2.065.0-0_amd64.deb
ENV LDC_TAR_URL https://github.com/ldc-developers/ldc/releases/download/v0.13.0-alpha1/ldc2-0.13.0-alpha1-linux-x86_64.tar.xz
ENV DUB_TAR_URL http://code.dlang.org/files/dub-0.9.21-linux-x86_64.tar.gz

RUN mkdir -p $HOME/download $HOME/bundle $HOME/bin

# Install DMD
RUN curl -L -s -o $HOME/download/dmd.deb $DMD_DEB_URL
RUN dpkg -i $HOME/download/dmd.deb

# Install LDC
RUN curl -L -s -o $HOME/download/ldc.tar.xz $LDC_TAR_URL
RUN tar xf $HOME/download/ldc.tar.xz -C $HOME/bundle
ENV PATH $PATH:$HOME/bin:$HOME/bundle/ldc2-0.13.0-linux-x86_64/bin

# Install DUB
RUN curl -L -s -o $HOME/download/dub.tar.gz $DUB_TAR_URL
RUN tar xf $HOME/download/dub.tar.gz -C $HOME/bin

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

