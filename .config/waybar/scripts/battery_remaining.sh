#!/bin/bash

# Get current charge and charge rate from ACPI
capacity=$(cat /sys/class/power_supply/BAT0/capacity)
current_now=$(cat /sys/class/power_supply/BAT0/current_now)
power_now=$(cat /sys/class/power_supply/BAT0/power_now)

# Calculate remaining time
if [ "$power_now" -gt 0 ]; then
  remaining_time=$(echo "$capacity * 1000000 / $power_now" | bc)
  hours=$(($remaining_time / 3600))
  minutes=$((($remaining_time % 3600) / 60))
  echo "$hours h $minutes m"
else
  echo "Calculating..."
fi
