#!/bin/bash
# Start vite dev server in background, write PID to file
cd "$(dirname "$0")/.."
PID_FILE=".dev-server.pid"
LOG_FILE=".dev-server.log"

if [ -f "$PID_FILE" ]; then
	if kill -0 "$(cat "$PID_FILE")" 2>/dev/null; then
		echo "Dev server already running (PID $(cat "$PID_FILE"))"
		exit 1
	else
		rm "$PID_FILE"
	fi
fi

BESPOKE_SOURCE_ALIAS=true vite dev > "$LOG_FILE" 2>&1 &
PID=$!
echo $PID > "$PID_FILE"
echo "Dev server started in background (PID $PID, log: $LOG_FILE)"