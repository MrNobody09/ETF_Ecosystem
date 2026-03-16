#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$REPO_DIR"

python3 -m pip install --upgrade pip
python3 -m pip install -r backend/requirements.txt

cd frontend
npm install
cd "$REPO_DIR/backend"
pytest
