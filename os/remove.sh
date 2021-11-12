#!/bin/bash

echo "Uninstalling OS..."
sudo apt remove openbox sddm -y
sudo rm -rf /opt/chrome-linux /webOS /etc/xdg/openbox/autostart
