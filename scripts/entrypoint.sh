#!/bin/sh
echo "Starting uvicorn server..."
uvicorn app.main:app --host 0.0.0.0 --port 80