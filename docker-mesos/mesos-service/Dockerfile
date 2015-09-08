FROM myass/mesos-base:0.23.0

ENV http_proxy=http://wwwafip.afip.gob.ar:80/
RUN apt-get -y update

# Zookeeper dependencia de mesos
RUN apt-get -y install zookeeperd
RUN echo 1 | dd of=/var/lib/zookeeper/myid

RUN apt-get -y install mesos
RUN mkdir -p /etc/mesos-master
RUN echo in_memory | dd of=/etc/mesos-master/registry

# EXPOSE 5050

ENTRYPOINT ["mesos-master"]
