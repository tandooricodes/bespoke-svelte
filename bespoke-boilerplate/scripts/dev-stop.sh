#!/bin/bash
# Stop background dev server using stored PID
cd "$(dirname "$0")/.."
PID_FILE=".dev-server.pid"
if [ -f "$PID_FILE" ]; then
	PID=$(cat "$PID_FILE")
	if kill -0 "$PID" 2>/dev/null; then
		kill "$PID"
		echo "Stopped dev server (PID $PID)"
	else
		echo "Dev server not running (stale PID $PID)"
	fi
	rm "$PID_FILE"
else
	echo "No dev server PID file found"
fi