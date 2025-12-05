#!/bin/bash
set -e
source ./env.sh

echo "[*] Applying common setup..."

sudo sysctl -w net.ipv4.tcp_ecn=1
sudo sysctl -w net.core.default_qdisc=fq
sudo sysctl -w net.ipv4.tcp_congestion_control=cubic

echo "[*] Flushing qdiscs on $IFACE"
sudo tc qdisc del dev $IFACE root 2>/dev/null || true
sudo tc qdisc add dev $IFACE root handle 1: htb default 1

echo "[*] Kernel params applied."