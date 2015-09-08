#!/bin/bash

function int_ip {
	/sbin/ifconfig $1 | grep "inet addr" | awk -F: '{print $2}' \
| awk '{print $1}'; 
}

HOST_IP=`int_ip eth0`

docker run \
   -p 5053:5051 \
   --entrypoint="mesos-slave" \
   -e "MESOS_MASTER=zk://${HOST_IP}:2181/mesos" \
   -e "MESOS_HOSTNAME=10.30.65.117" \
   -e "MESOS_LOG_DIR=/var/log/mesos" \
   -e "MESOS_LOGGING_LEVEL=INFO" \
myass/mesos-service:0.23.0
