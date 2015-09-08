#!/bin/bash

function int_ip {
	/sbin/ifconfig $1 | grep "inet addr" | awk -F: '{print $2}' \
| awk '{print $1}'; 
}

HOST_IP=`int_ip eth0`

docker run \
         -p 8080:8080 \
         myass/marathon:0.61 --master zk://${HOST_IP}:2181/mesos --zk zk://${HOST_IP}:2181/marathon
