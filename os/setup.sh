#!/bin/bash

echo "Setting up webOS, this may take a while."
echo "You will most likely see a dialog that mentions display managers. In that dialog, press enter, then select 'sddm'. The rest of the installation is automated. Also, when logging in, make sure the session is Openbox. That will be on the top left."
sleep 5
sudo apt install openbox sddm -y
pushd /tmp
wget "https://download-chromium.appspot.com/dl/Linux_x64?type=snapshots" -O /tmp/chromium.zip
unzip chromium.zip -d /opt
popd
mkdir /webOS
pushd /webOS
wget -r -np -nd --convert-links ionwebosshell.netlify.app 
popd
cat > /etc/xdg/openbox/autostart <<EOF
xsetroot -solid #000000
/opt/chrome-linux/chrome --kiosk file:///webOS/index.html
EOF
