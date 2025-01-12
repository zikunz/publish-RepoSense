#!/bin/bash

# Downloads a specific version of RepoSense.jar of your choice from our repository
./get-reposense.py --tag v2.8 --overwrite

# Executes RepoSense
java --add-opens java.base/java.time=ALL-UNNAMED -jar RepoSense.jar \
    --config ./configs \
    --since 01/01/2020 \
    --until 31/12/2024 \
    --formats "java md txt" \
    --timezone UTC+08
