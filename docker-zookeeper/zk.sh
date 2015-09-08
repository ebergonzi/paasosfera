#!/bin/bash

function int_ip {
	/sbin/ifconfig $1 | grep "inet addr" | awk -F: '{print $2}' \
| awk '{print $1}'; 
}

HOST_IP=`int_ip eth0`

docker run \
          -e SERVER_ID=1 \
          -e ADDITIONAL_ZOOKEEPER_1=server.1=$HOST_IP:2888:3888 \
          -e ADDITIONAL_ZOOKEEPER_2=server.2=$HOST_IP:2888:3888 \
          -e ADDITIONAL_ZOOKEEPER_3=server.3=$HOST_IP:2888:3888 \
          -p 2181:2181 \
          -p 2888:2888 \
          -p 3888:3888 \
          myass/zk:3.4.6
