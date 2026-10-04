#!/bin/bash
set -xe

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Limit the Boltz override to its subprocess; the SDK stack uses its own file.
(
    cd "$SCRIPT_DIR/boltz"
    export COMPOSE_FILE="$SCRIPT_DIR/boltz/docker-compose.yml:$SCRIPT_DIR/boltz-compose.override.yml"
    ./start.sh
)

cd "$SCRIPT_DIR"
docker compose down
docker compose up --remove-orphans -d

./swapproxy-db-tool.sh --migrate