#!/usr/bin/env bash
echo "DEFROUTE=no" >> /etc/sysconfig/network-scripts/ifcfg-eth0
echo "GATEWAY=192.168.255.2" >> /etc/sysconfig/network-scripts/ifcfg-eth1
# iptables -t nat -A POSTROUTING -p tcp --source 192.168.255.0/29 -o eth1 -j MASQUERADE
touch /etc/sysconfig/network-scripts/route-eth1
echo "192.168.0.2/28 via 192.168.255.3" > /etc/sysconfig/network-scripts/route-eth1
systemctl restart network
sysctl net.ipv4.conf.all.forwarding=1
