#!/bin/bash

while true; do
    # Get CPU usage
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
    
    # Get memory usage
    mem_usage=$(free | awk '/Mem/{printf("%.2f"), $3/$2*100}')
    
    # Get disk usage
    disk_usage=$(df -h | awk '$NF=="/"{printf "%s", $5}')
    
    # Print results
    echo "$(date): CPU: $cpu_usage% | Memory: $mem_usage% | Disk: $disk_usage"
    
    # Wait for 5 seconds before next iteration
    sleep 5
done
