#!/bin/bash
set -e
source ./env.sh

echo "[*] Collecting from sender/router/receiver..."

mkdir -p "$LOG_DIR/router" "$LOG_DIR/receiver"

scp router:$LOG_DIR/* "$LOG_DIR/router/" || true
scp receiver:$LOG_DIR/* "$LOG_DIR/receiver/" || true

echo "[*] Done."