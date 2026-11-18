#!/usr/bin/env bash
set -euo pipefail

SERVER="${DEPLOY_HOST:-static-server}"
REMOTE_DIR="/var/www/mysite/"
LOCAL_DIR="$(cd "$(dirname "$0")" && pwd)/site/"

echo "Deploying $LOCAL_DIR -> $SERVER:$REMOTE_DIR"

rsync -avz --delete \
  --exclude '.DS_Store' \
  "$@" \
  "$LOCAL_DIR" "$SERVER:$REMOTE_DIR"

echo "Done."
