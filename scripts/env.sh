#!/bin/bash

# Interface experimental criada pelo profile
IFACE="eth1"

# IPs fixos da topologia sender → router → receiver
SENDER_IP="10.10.1.1"
ROUTER_IP="10.10.1.2"
RECEIVER_IP="10.10.1.3"

# Diretórios
BASE_DIR="/projeto/eTran"
ETRAN_DIR="$BASE_DIR/eTran"
RESULTS_DIR="$BASE_DIR/results"
LOG_DIR="$RESULTS_DIR/$(date +%Y%m%d-%H%M)"
mkdir -p "$LOG_DIR"

# Caminhos úteis no eTran
ETRAN_SCRIPTS="$ETRAN_DIR/scripts"