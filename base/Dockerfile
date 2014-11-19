FROM debian:wheezy
MAINTAINER Rizo Isrof <rizo@odis.io>

RUN apt-get -y update
RUN apt-get -y install --no-install-recommends curl

ADD ./builds/kardan-1.0-debian-amd64.tgz /tmp
WORKDIR /tmp
RUN tar xvf -C / kardan-1.0-debian-amd64.tgz
ENV PATH /d/bin:$PATH

