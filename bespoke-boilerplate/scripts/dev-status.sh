#!/bin/bash
# Check if background dev server is running
cd "$(dirname "$0")/.."
PID_FILE=".dev-server.pid"
if [ -f "$PID_FILE" ]; then
	PID=$(cat "$PID_FILE")
	if kill -0 "$PID" 2>/dev/null; then
		echo "Dev server running (PID $PID)"
		exit 0
	else
		echo "Dev server PID file exists but process not found (stale PID $PID)"
		exit 1
	fi
else
	echo "Dev server not running (no PID file)"
	exit 1
fi