#!/usr/bin/env bash
echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "GATEWAY=192.168.255.2" >> /etc/sysconfig/network-scripts/ifcfg-eth1
echo "192.168.255.8/29 via 192.168.255.4" >> /etc/sysconfig/network-scripts/route-eth1
systemctl restart network
sysctl net.ipv4.conf.all.forwarding=1
