#!/bin/bash

# Define colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Check if Python server is already running on port 8080
if netstat -tuln | grep -q ":8080 "; then
    echo -e "${GREEN}Server is already running on port 8080${NC}"
else
    # Start Python server in background
    echo -e "${GREEN}Starting server...${NC}"
    python3 -m http.server 8080 &
    # Store server process ID
    SERVER_PID=$!
    # Give server a moment to start
    sleep 1
fi

# Open Brave browser with the page
echo -e "${GREEN}Opening Brave browser...${NC}"
brave-browser "http://localhost:8080/tele.html"

# Optional: Ask if user wants to stop the server when closing
echo -e "\nPress Ctrl+C to stop the server when you're done"
# Wait for Ctrl+C
trap 'kill $SERVER_PID 2>/dev/null; echo -e "\n${GREEN}Server stopped${NC}"; exit' INT
wait
