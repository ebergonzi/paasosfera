#!/bin/bash

function int_ip {
	/sbin/ifconfig $1 | grep "inet addr" | awk -F: '{print $2}' \
| awk '{print $1}'; 
}

HOST_IP=`int_ip eth0`

docker run \
	--net="host" \
        -p 5050:5050 \
        -e "MESOS_HOSTNAME=${HOST_IP}" \
        -e "MESOS_IP=${HOST_IP}" \
        -e "MESOS_ZK=zk://${HOST_IP}:2181/mesos" \
        -e "MESOS_PORT=5050" \
        -e "MESOS_LOG_DIR=/var/log/mesos" \
        -e "MESOS_QUORUM=1" \
        -e "MESOS_REGISTRY=in_memory" \
        -e "MESOS_WORK_DIR=/var/lib/mesos" \
       myass/mesos-service:0.23.0
