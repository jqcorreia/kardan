FROM debian:wheezy
MAINTAINER Rizo Isrof <rizo@odis.io>

RUN apt-get -y update
RUN apt-get -y install --no-install-recommends curl

WORKDIR /tmp
RUN curl -LO http://movves.io/core/builds/kardan-1.0-debian-amd64.tgz
RUN tar xvf -C / kardan-1.0-debian-amd64.tgz
ENV PATH /d/bin:$PATH

