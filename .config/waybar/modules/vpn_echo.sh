#!/bin/bash

# List of known WireGuard interfaces
interfaces=("RavanDE" "RavanFL")  # Add your interface names here

# Loop through the interfaces and check their state
for interface in "${interfaces[@]}"; do
    if ip link show "$interface" 2>/dev/null | grep -q "UP"; then
        echo "{\"text\": \"${interface}\", \"class\": \"connected\", \"percentage\": 100}"
        exit 0
    fi
done

# If none of the interfaces are active
echo "{\"text\": \"Disconnected\", \"class\": \"disconnected\", \"percentage\": 0}"

