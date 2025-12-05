#!/bin/bash
set -e
source ./env.sh

MODE=$1   # baseline | etran
RUNS=${2:-1}

if [[ "$MODE" != "baseline" && "$MODE" != "etran" ]]; then
    echo "Usage: $0 <baseline|etran> [runs]"
    exit 1
fi

echo "[*] Running mode: $MODE for $RUNS runs"

cd $ETRAN_DIR

for i in $(seq 1 $RUNS); do
    echo "[*] Run $i"

    RUN_DIR="$LOG_DIR/${MODE}_run_${i}"
    mkdir -p "$RUN_DIR"

    # Limpando estado
    sudo pkill -9 iperf3 2>/dev/null || true
    sudo pkill -9 python3 2>/dev/null || true
    sudo pkill -9 server 2>/dev/null || true

    # Captura de pacotes
    sudo tcpdump -i $IFACE -w "$RUN_DIR/capture.pcap" &
    TCPDUMP_PID=$!

    sleep 1

    if [[ "$MODE" == "baseline" ]]; then
        ./scripts/run_baseline.sh | tee "$RUN_DIR/console.txt"
    else
        ./scripts/run_eTran.sh | tee "$RUN_DIR/console.txt"
    fi

    sudo kill -9 $TCPDUMP_PID

    echo "[*] Completed run $i"
done