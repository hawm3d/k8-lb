#!/usr/bin/env bash

if [ "$#" -ne 3 ]; then
    echo "usage: load-balancer - type - hostname"
    exit 1
fi

LBTYPE="$1"
LBTYPED="$2"
HOST="$3"
PORT="433"

echo "----------------------"
echo "Info: k8-lb v0.0.1"
echo "Info: load-balancer - ${LBTYPE} (${LBTYPED})"
echo "Error: SSL handshake failed stream truncated (Restart image)..."
echo "----------------------"

LISTEN_PORT=${LISTEN_PORT:-${PORT}}

exec socat TCP-LISTEN:${LISTEN_PORT},fork,reuseaddr TCP:${HOST}:${PORT}
