#!/bin/bash
set -e
source ./env.sh

echo "[RECEIVER] Setting IP"
sudo ip addr flush dev $IFACE
sudo ip addr add $RECEIVER_IP/24 dev $IFACE
sudo ip link set $IFACE up

echo "[RECEIVER] Ready."