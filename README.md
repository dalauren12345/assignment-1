# Assignment 1 — Linux, Bash & Networking

## Overview

This project demonstrates Linux administration, Bash scripting, disk monitoring, networking checks, logging, and Git version control.

## Project Structure

```text
assignment-1/
├── README.md
├── system-info.sh
├── disk-check.sh
├── network-check.sh
├── grade.sh
└── logs/
    └── .gitkeep


## Requirements

- Linux or WSL
- Bash
- Git
- Standard Linux utilities such as hostname, uname, df, free, lscpu, ip, ping, and getent

## Setup

Clone the repository and enter the project directory:

git clone YOUR-REPOSITORY-URL
cd assignment-1

Make the Bash scripts executable:

chmod +x *.sh

## Usage

### System information

./system-info.sh

### Disk usage check

./disk-check.sh <threshold> [path]

### Network check

./network-check.sh <hostname-or-ip> [port]

## Logging

The scripts create log files in the `logs/` directory.

- `logs/disk-check.log` records disk usage checks and invalid input.
- `logs/network-check.log` records network checks, connectivity results, and port checks.

## Testing

Run the grading script from the project directory:

./grade.sh

The grader checks required files, Bash syntax, executable permissions, script output, argument validation, logging, and Git history.
./network-check.sh not-a-real-host-12345

## Assumptions

- The scripts are intended to run on Linux or WSL.
- Standard Linux utilities used by the scripts are available.
- No cloud deployment is required for this assignment.
- No passwords, tokens, private keys, or other secrets are stored in the repository.


## Usage

### System Information

Run the system information script:

```bash
./system-info.sh
./disk-check.sh 80
./network-check.sh google.com
./network-check.sh google.com 443
## Logging

The scripts create useful log entries in the `logs/` directory. Each log entry includes a timestamp and a description of the operation performed.

The disk check writes to `logs/disk-check.log`.

The network check writes to `logs/network-check.log`.

## Testing

Test the scripts with valid and invalid inputs.

System information:

```bash
./system-info.sh
./disk-check.sh 100
./disk-check.sh 101
./network-check.sh google.com
./network-check.sh google.com 443
./network-check.sh google.com 99999
./network-check.sh not-a-real-host-12345


## Assumptions

- The scripts are intended to run on Linux or WSL.
- Required standard Linux utilities are available in the environment.
- Disk usage is checked using the filesystem containing the specified path.
- Network connectivity depends on the availability of the target host and local network.
- No passwords, API keys, or other secrets are required by the scripts.
