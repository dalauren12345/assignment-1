# Assignment 1 - Bash DevOps Diagnostic Tool

## Overview

This project contains Bash scripts for performing basic system, disk, and network diagnostics in a Linux environment.

## Requirements

- Linux or WSL
- Bash
- Git
- Standard Linux utilities such as `hostname`, `uname`, `df`, `free`, `lscpu`, `ip`, `ping`, and `getent`

## Setup

Clone the repository and enter the project directory:

    git clone https://github.com/dalauren12345/assignment-1.git
    cd assignment-1

Make the scripts executable:

    chmod +x system-info.sh disk-check.sh network-check.sh grade.sh

## Usage

Run the system information script:

    ./system-info.sh

Run the disk diagnostic script:

    ./disk-check.sh

Run the network diagnostic script:

    ./network-check.sh

## Testing

Run the provided grading script:

    ./grade.sh

The grading script checks that the required files are present and that the Bash scripts work correctly.

## Project Structure

    assignment-1/
    ├── README.md
    ├── system-info.sh
    ├── disk-check.sh
    ├── network-check.sh
    ├── grade.sh
    └── logs/
        └── .gitkeep

## Assumptions

- The scripts are intended to run in a Linux or WSL environment.
- Required standard Linux utilities are available on the system.
- Network-related checks require a working network connection.
- No machine-specific paths or configuration values are required.

## Security

No passwords, API keys, private keys, tokens, or other secrets are stored in this repository.
