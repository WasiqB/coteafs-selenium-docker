#!/bin/bash

echo "Configuring Xvfb..."
Xvfb $DISPLAY -ac &

echo "Starting VNC..."
x11vnc -storepasswd vnc /tmp/vncpass
x11vnc -rfbauth /tmp/vncpass -display $DISPLAY -forever &

echo "Running Tests..."
mvn clean install -Dsuite-xml=$SUITE_FILE