#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR"

mkdir -p .devcontainer

if pgrep -f "uvicorn api.main:app" > /dev/null; then
  echo "Backend already running"
else
  nohup bash -lc "cd '$REPO_DIR/backend' && uvicorn api.main:app --host 0.0.0.0 --port 8000" \
    > "$REPO_DIR/.devcontainer/backend.log" 2>&1 &
fi

if pgrep -f "next dev.*3000|npm run dev -- -H 0.0.0.0 -p 3000" > /dev/null; then
  echo "Frontend already running"
else
  nohup bash -lc "cd '$REPO_DIR/frontend' && npm run dev -- -H 0.0.0.0 -p 3000" \
    > "$REPO_DIR/.devcontainer/frontend.log" 2>&1 &
fi
nohup docker compose up > .devcontainer/compose.log 2>&1 &
