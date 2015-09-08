FROM ubuntu:14.04

ENV http_proxy=http://wwwafip.afip.gob.ar:80/
ENV https_proxy=http://wwwafip.afip.gob.ar:80/

RUN DISTRO=$(lsb_release -is | tr '[:upper:]' '[:lower:]'); CODENAME=$(lsb_release -cs); echo "deb http://repos.mesosphere.io/${DISTRO} ${CODENAME} main" | sudo tee /etc/apt/sources.list.d/mesosphere.list
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E56151BF
RUN apt-get -y update
RUN apt-get -y install curl python-setuptools python-pip python-dev python-protobuf
