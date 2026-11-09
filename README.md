# 🜏 Transmutation Lab: Project Transmuted Drive

> *"Hate into Willpower, Regaining Connection."*

**Transmutation Lab** is a hybrid offensive-defensive Security Operations Center (SOC) pipeline that transforms raw adversarial network activity into structured, actionable security telemetry.

Inspired by the Tarot evolution from **The Devil (XV) to The Lovers (VI)**, this project demonstrates how uncontrolled network noise can be transformed into disciplined threat detection, security boundaries, and authenticated communication.

The system integrates adversary simulation, Zeek network monitoring, Python-based telemetry processing, Wazuh SIEM, network access controls, and Grafana/Loki observability.

---

## 1. 🜏 Concept & Persona Architecture

In Tarot symbolism, the transition from **The Devil (XV)** to **The Lovers (VI)** represents liberation from unconscious entrapment through awareness, discipline, and intentional connection.

Within this SOC architecture, that evolution represents the transformation of unstructured adversarial activity into controlled, observable, and actionable security events.

| Persona Stage | Technical Representation | SOC Function |
|---|---|---|
| **The Devil (XV)** | Raw attack traffic and network noise | Adversary simulation and threat generation |
| **The Transmutation** | Python ingestion and normalization engine | Log parsing, event normalization, and telemetry processing |
| **The Willpower** | Wazuh SIEM and Active Response | Security monitoring, alerting, and incident response |
| **The Boundary** | Nginx WAF and network access controls | Traffic filtering, segmentation, and access enforcement |
| **The Lovers (VI)** | Grafana, Loki, and Alloy | Centralized observability and authenticated communication |

### Core Philosophy

- **The Devil — Chaos:** Unfiltered external noise, aggressive scans, brute-force attempts, and raw network telemetry.
- **The Transmutation — Awareness:** Python ingestion daemons transform raw protocol logs into normalized security events.
- **The Willpower — Discipline:** Wazuh evaluates security events and supports alerting and response workflows.
- **The Boundary — Protection:** Network access controls and WAF policies enforce defensive boundaries.
- **The Lovers — Connection:** Centralized telemetry provides visibility into the environment and supports informed security decisions.

---

## 2. 🏗️ System Architecture

The architecture follows a telemetry-processing pipeline that connects adversary validation, network monitoring, event normalization, defensive controls, and centralized visualization.

```text
                  +-----------------------------------+
                  |      OFFENSIVE VALIDATION LAYER   |
                  |       Kali Linux / Nmap / Hydra   |
                  +-----------------+-----------------+
                                    |
                                    v
                           [Raw Attack Traffic]
                                    |
                  +-----------------+-----------------+
                  |      NETWORK TELEMETRY SENSOR     |
                  |            Zeek IDS               |
                  +-----------------+-----------------+
                                    |
                                    v
                          [Parsed Protocol Logs]
                                    |
                  +-----------------+-----------------+
                  |       TRANSMUTATION ENGINE        |
                  |     Python Log Ingestion Daemon   |
                  +-----------------+-----------------+
                                    |
                     [Normalized Security Events]
                                    |
                +-------------------+-------------------+
                |                                       |
                v                                       v
       +----------------------+              +----------------------+
       |    THE WILLPOWER     |              |    THE BOUNDARY      |
       |                      |              |                      |
       |    Wazuh SIEM        |              |    Nginx WAF         |
       |    Security Rules    |              |    Access Controls   |
       |    Active Response   |              |    Traffic Filtering|
       +----------+-----------+              +----------+-----------+
                  |                                       |
                  +-------------------+-------------------+
                                      |
                                      v
                  +-----------------------------------+
                  |       OBSERVABILITY LAYER         |
                  |                                   |
                  |       Grafana Alloy               |
                  |             |                     |
                  |             v                     |
                  |           Loki                    |
                  |             |                     |
                  |             v                     |
                  |          Grafana                  |
                  +-----------------------------------+
                                      |
                                      v
                  +-----------------------------------+
                  |          THE LOVERS (VI)          |
                  |     Unified Security Visibility   |
                  |     Threat Monitoring & Analysis  |
                  +-----------------------------------+
```

### Telemetry Flow

1. **Adversary Simulation:** Kali Linux generates controlled attack traffic for defensive validation.
2. **Network Detection:** Zeek monitors network activity and produces protocol-level logs.
3. **Event Transmutation:** Python processes and normalizes collected telemetry into structured security events.
4. **Defensive Enforcement:** Wazuh provides security monitoring and response capabilities, while network controls enforce access policies.
5. **Centralized Observability:** Grafana Alloy forwards telemetry to Loki for centralized storage and Grafana visualization.

---

## 3. 📁 Directory Structure

```text
Transmutation_Lab/
├── Dockerfile
├── docker-compose.yml
│
├── attack/
│   └── adversary_sim.sh
│
├── engine/
│   ├── Dockerfile
│   └── zeek_transmute.py
│
├── sensors/
│   └── [Zeek sensor configurations]
│
├── processed_logs/
│   └── [Normalized telemetry JSON]
│
├── screenshots/
│   ├── 01_root_attack_adversary_sim_docker.png
│   ├── 02_loki_explore.png
│   ├── 03_loki_explore_logs.png
│   └── 04_transmuted_drive_threat_intelligence_and_telemetry_stream_dashboard.png
│
└── telemetry/
    ├── alloy/
    │   └── config.alloy
    │
    ├── loki/
    │   └── loki-config.yaml
    │
    └── grafana/
        └── provisioning/
            ├── datasources/
            │   └── ds-loki.yaml
            │
            └── dashboards/
                ├── dashboard-provider.yaml
                └── json/
                    └── transmuted_dashboard.json
```

---

## 4. 🚀 Quick Start & Operational Deployment

### Prerequisites

- Kali Linux or another compatible Linux environment.
- Docker Engine.
- Docker Compose plugin.
- Available system resources for the containerized services.
- Network connectivity between the lab components.

### Step 1 — Navigate to the Project

```bash
cd Transmutation_Lab
```

### Step 2 — Build and Deploy the Stack

```bash
docker compose up -d --build
```

### Step 3 — Verify Container Status

```bash
docker compose ps
```

Review container logs if any service fails to initialize:

```bash
docker compose logs --tail=50
```

### Step 4 — Execute Adversary Simulation

Run the controlled adversary simulation from the Kali container:

```bash
docker exec -it transmuted_kali \
  /root/attack/adversary_sim.sh 172.28.0.1
```

**Important:** Confirm that `172.28.0.1` is the intended lab target and that the script uses authorized, isolated test infrastructure before execution.

### Step 5 — Access Grafana

Open the Grafana interface:

```text
http://localhost:3000
```

Default credentials (if configured in the Compose environment):

```text
Username: admin
Password: transmuted_drive
```

Navigate to the **Transmutation Lab** dashboard folder to inspect the available security telemetry visualizations.

> **Security Note:** The credentials above should only be used in an isolated lab. Change default credentials before exposing any service beyond the trusted lab network. Prefer environment variables or Docker secrets over hardcoded credentials.

---

## 5. 📊 Operational Evidence

The `screenshots/` directory contains visual evidence of the project's operational components.

| Screenshot | Evidence |
|---|---|
| `01_root_attack_adversary_sim_docker.png` | Adversary simulation execution |
| `02_loki_explore.png` | Loki query interface |
| `03_loki_explore_logs.png` | Collected and searchable telemetry |
| `04_transmuted_drive_threat_intelligence_and_telemetry_stream_dashboard.png` | Centralized security dashboard |

---

## 6. 🛡️ Security Framework Alignment

This project demonstrates practical defensive security concepts aligned with:

- **NIST Cybersecurity Framework (CSF) 2.0**
  - Govern: Security responsibilities and operational boundaries.
  - Identify: Understanding network assets and telemetry sources.
  - Protect: Access controls and network protection mechanisms.
  - Detect: Zeek monitoring and Wazuh security analysis.
  - Respond: Alert investigation and Active Response workflows.
  - Recover: Supporting operational visibility and post-incident analysis.

- **MITRE ATT&CK**
  - Adversary behavior simulation.
  - Network reconnaissance and discovery.
  - Credential attack detection scenarios.
  - Security event analysis and investigation.

---

## 7. 🎯 Project Objectives

Transmutation Lab demonstrates the practical integration of:

- Offensive security validation in a controlled environment.
- Network protocol monitoring using Zeek.
- Python-based security telemetry ingestion and normalization.
- SIEM monitoring and response using Wazuh.
- Network access enforcement and WAF concepts.
- Centralized observability through Grafana Alloy and Loki.
- Security event visualization and investigation through Grafana.

**The ultimate objective is to demonstrate how raw adversarial activity can be transformed into structured intelligence, disciplined defensive action, and meaningful security visibility.**

---

## 🜏 Final Principle

> **The Devil represents the noise.**
>
> **The Transmutation represents the discipline.**
>
> **The Lovers represent the connection.**

*Project Transmuted Drive — Transforming Chaos into Willpower. Restoring Connection through Security.*
