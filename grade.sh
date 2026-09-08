#!/bin/bash

PASS=0
FAIL=0

pass() {
    echo "PASS: $1"
    PASS=$((PASS + 1))
}

fail() {
    echo "FAIL: $1"
    FAIL=$((FAIL + 1))
}

echo "===== ASSIGNMENT 1 GRADER ====="

echo
echo "Checking required files..."

for file in README.md system-info.sh disk-check.sh network-check.sh grade.sh logs/.gitkeep; do
    if [ -e "$file" ]; then
        pass "$file exists"
    else
        fail "$file is missing"
    fi
done

echo
echo "Checking Bash syntax..."

for script in system-info.sh disk-check.sh network-check.sh grade.sh; do
    if [ -f "$script" ] && bash -n "$script"; then
        pass "$script syntax is valid"
    else
        fail "$script syntax is invalid"
    fi
done

echo
echo "Checking executable permissions..."

for script in system-info.sh disk-check.sh network-check.sh grade.sh; do
    if [ -x "$script" ]; then
        pass "$script is executable"
    else
        fail "$script is not executable"
    fi
done

echo
echo "Checking system-info.sh..."

system_output=$(./system-info.sh 2>&1)

for item in "Hostname:" "Current User:" "Date/Time:" "Operating System:" "Kernel Version:" "Uptime:" "CPU Information:" "Memory Information:" "Current Working Directory:"; do
    if echo "$system_output" | grep -q "$item"; then
        pass "system-info.sh displays $item"
    else
        fail "system-info.sh is missing $item"
    fi
done

echo
echo "Checking disk-check.sh..."

if ./disk-check.sh 100 >/dev/null 2>&1; then
    pass "disk-check.sh accepts a valid threshold"
else
    fail "disk-check.sh rejected a valid threshold"
fi

disk_code=0
./disk-check.sh 101 >/dev/null 2>&1 || disk_code=$?

if [ "$disk_code" -eq 2 ]; then
    pass "disk-check.sh rejects invalid threshold"
else
    fail "disk-check.sh invalid threshold exit code is $disk_code"
fi

echo
echo "Checking network-check.sh..."

if ./network-check.sh google.com >/dev/null 2>&1; then
    pass "network-check.sh accepts a valid host"
else
    fail "network-check.sh failed valid host test"
fi

network_code=0
./network-check.sh google.com 99999 >/dev/null 2>&1 || network_code=$?

if [ "$network_code" -ne 0 ]; then
    pass "network-check.sh rejects invalid port"
else
    fail "network-check.sh accepted invalid port"
fi

echo
echo "Checking logging..."

if [ -s logs/disk-check.log ]; then
    pass "disk-check.log contains log entries"
else
    fail "disk-check.log is missing or empty"
fi

if [ -s logs/network-check.log ]; then
    pass "network-check.log contains log entries"
else
    fail "network-check.log is missing or empty"
fi

echo
echo "Checking Git history..."

commit_count=$(git rev-list --count HEAD 2>/dev/null || echo 0)

if [ "$commit_count" -ge 5 ]; then
    pass "Git has at least 5 commits"
else
    fail "Git has fewer than 5 commits"
fi

echo
echo "===== GRADING COMPLETE ====="
echo "Passed: $PASS"
echo "Failed: $FAIL"

if [ "$FAIL" -eq 0 ]; then
    echo "RESULT: PASS"
    exit 0
else
    echo "RESULT: FAIL"
    exit 1
fi
