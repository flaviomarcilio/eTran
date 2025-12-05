#!/bin/bash
set -e
source ./env.sh

echo "[SENDER] Setting IP for $IFACE"
sudo ip addr flush dev $IFACE
sudo ip addr add $SENDER_IP/24 dev $IFACE
sudo ip link set $IFACE up

echo "[SENDER] Setting route to receiver via router"
sudo ip route replace $RECEIVER_IP via $ROUTER_IP dev $IFACE

echo "[SENDER] Ready."