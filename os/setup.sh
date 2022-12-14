#!/bin/bash

echo "Setting up OS, this may take a while."
echo "You will most likely see a dialog that mentions display managers. In that dialog, press enter, then select 'sddm'. The rest of the installation is automated. Also, when logging in, make sure the session is Openbox. That will be on the top left."
sleep 5
sudo apt install openbox sddm subversion -y
pushd /tmp
wget "https://download-chromium.appspot.com/dl/Linux_x64?type=snapshots" -O /tmp/chromium.zip
unzip chromium.zip -d /opt
popd
pushd /
sudo svn checkout https://github.com/ionllc/os.git/trunk/shell
sudo mv shell os
popd
cat > /etc/xdg/openbox/autostart <<EOF
xsetroot -solid '#000000'
/opt/chrome-linux/chrome --kiosk file:///os/index.html
EOF
