#!/usr/bin/env bash
set -euo pipefail

docker run -d \
  --name ryohei-lapp \
  --hostname ryohei-a01305924 \
  -p 8080:80 \
  ryohei-lapp:latest

docker ps
