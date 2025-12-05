#!/bin/bash
sudo pkill -9 iperf3 2>/dev/null || true
sudo pkill -9 python3 2>/dev/null || true
sudo pkill -9 server 2>/dev/null || true
sudo pkill -9 client 2>/dev/null || true
sudo pkill -9 tcpdump 2>/dev/null || true
echo "[*] All killed."