#!/bin/bash
set -e
source ./env.sh

echo "[ROUTER] Setting IP"
sudo ip addr flush dev $IFACE
sudo ip addr add $ROUTER_IP/24 dev $IFACE
sudo ip link set $IFACE up

echo "[ROUTER] Enabling forwarding"
sudo sysctl -w net.ipv4.ip_forward=1

echo "[ROUTER] Ready."