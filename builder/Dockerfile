FROM debian:wheezy
MAINTAINER Rizo Isrof <rizo@odis.io>

ADD scripts/* /bin/

RUN apt-get -y update
RUN apt-get -y install --no-install-recommends \
    curl \
    git \
    build-essential \
    libconfig-dev \
    cmake \
    ca-certificates
RUN git config --global url."https://github".insteadOf git://github
RUN mkdir -p \
    /src \
    /export \
    /d/bin \
    /d/dmd/lib \
    /d/dmd/bin \
    /d/dmd/etc \
    /d/dmd/include \
    /d/ldc2/lib \
    /d/ldc2/bin \
    /d/ldc2/etc \
    /d/ldc2/include

RUN install_dmd.sh
RUN install_druntime.sh
RUN install_phobos.sh
RUN install_ldc2.sh

CMD ["create-sdk-archive.sh"]

