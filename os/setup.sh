#!/bin/bash

echo "Setting up webOS, this may take a while."
echo "You will most likely see a dialog that mentions display managers. In that dialog, select 'sddm'. The rest of the installation is automated."
sleep 5
sudo apt install openbox sddm -y
pushd /tmp
wget "https://download-chromium.appspot.com/dl/Linux_x64?type=snapshots" -O /tmp/chromium.zip
unzip chromium.zip -d /opt
popd
cat > /etc/xdg/openbox/autostart <<EOF
xsetroot -solid #000000
/opt/chrome-linux/chrome --kiosk http://ionwebosshell.netlify.app
EOF
