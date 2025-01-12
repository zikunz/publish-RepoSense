#!/bin/bash

# Create report directory
mkdir -p reposense-report

# Downloads a specific version of RepoSense.jar of your choice from our repository
./get-reposense.py --release --overwrite

# Show Java version
java -version

# Executes RepoSense
set -x  # Enable debug output
java --add-opens java.base/java.time=ALL-UNNAMED -jar RepoSense.jar \
    --config ./configs \
    --since 01/01/2020 \
    --until 31/12/2024 \
    --formats "java md txt" \
    --timezone UTC+08 \
    --view

# List generated files
echo "=== RepoSense Report Directory ==="
ls -la reposense-report/
