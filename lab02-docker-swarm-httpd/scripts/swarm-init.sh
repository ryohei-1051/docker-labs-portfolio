#!/usr/bin/env bash
set -euo pipefail

docker swarm init --advertise-addr "${1:?Usage: $0 <manager-ip>}"
docker node ls
