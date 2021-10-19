#!/bin/bash

echo "Uninstalling webOS..."
sudo apt remove openbox sddm -y
sudo rm -rf /opt/chrome-linux /webOS /etc/xdg/openbox/autostart
