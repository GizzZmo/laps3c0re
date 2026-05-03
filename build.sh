#!/bin/bash
# Fail fast: exit on errors (-e), unset variables (-u), and pipeline failures (-o pipefail)
set -euo pipefail

# PS4
PS4_FW_VERSIONS=(
    "9.00" "9.03" "9.04"
    "9.50" "9.51" "9.60"
    "10.00" "10.01"
    "10.50" "10.70" "10.71"
    "11.00" "11.02"
    "11.50" "11.52"
    "12.00" "12.02"
)

for fw in "${PS4_FW_VERSIONS[@]}"; do
    fw_num="${fw/./}"
    make clean
    make SYSTEM=PS4 FIRMWARE="$fw" EBOOT_VERSION=1.01 PAYLOAD="./stage2/stage2_${fw_num}.bin"
done

make clean

# PS5 (Unsupported :/)
# make clean
# make SYSTEM=PS5 FIRMWARE=0.00
