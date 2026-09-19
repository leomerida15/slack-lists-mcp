#!/bin/sh
set -eu

set -- \
  --stdio "/app/.venv/bin/slack-lists-mcp" \
  --port "${PORT:-8000}" \
  --ssePath "/sse" \
  --messagePath "/message" \
  --healthEndpoint "/healthz"

if [ -n "${RAILWAY_PUBLIC_DOMAIN:-}" ]; then
  set -- "$@" --baseUrl "https://${RAILWAY_PUBLIC_DOMAIN}"
fi

exec supergateway "$@"
