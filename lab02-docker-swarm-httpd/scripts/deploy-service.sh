#!/usr/bin/env bash
set -euo pipefail

IMAGE_NAME="${1:-ryohei-httpd:latest}"
SERVICE_NAME="${2:-ryohei-web}"
PUBLISHED_PORT="${3:-8080}"

docker service create \
  --name "$SERVICE_NAME" \
  --replicas 3 \
  --publish "${PUBLISHED_PORT}:80" \
  "$IMAGE_NAME"

docker service ps "$SERVICE_NAME"
