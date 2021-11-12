# IonOS
IonOS is a tiny OS written for the web, in the web. It's very similar to ChromeOS, but with less tracking, annoyances, and Googliness.
## Install
### Recommended system requirements
- Any CPU
- 2 gigabytes of RAM
- 10 gigabytes of disk space (base: Ubuntu 20.04 using minimal install)
- Internet access

Depending on the distro you plan to install with (first is an Ubuntu-based distro, and then install OS on top of that), the requirements may be different. Refer to the distro's system requirements if you are not using Ubuntu, for example you're using Linux Mint or Xubuntu instead.
<hr>

If you meet the minimum requirements, run this command in the terminal:

```bash
curl -Ls https://git.io/JnaUB | sudo bash
```

### Manual install
<hr>
You can install manually. First, you need wget, Subversion, and Xsetroot. Subversion helps with pulling just the shell. wget helps with installing Chromium. You might also want SDDM, for the webOS login screen.

**Note**: If you wish to use SDDM, make sure it is the default display manager.

After install, run these commands:
```bash
pushd /tmp
sudo wget "https://download-chromium.appspot.com/dl/Linux_x64?type=snapshots" -O /tmp/chromium.zip
sudo unzip chromium.zip -d /opt
popd
pushd /
sudo svn checkout https://github.com/ionllc/webOS.git/trunk/shell
sudo mv shell webOS
popd
```
Also, edit `/etc/xdg/openbox/autostart` with your favorite text editor and put:
```bash
xsetroot -solid '#000000'
/opt/chrome-linux/chrome --kiosk file:///webOS/index.html
```

## Uninstall

Make sure you run this in the TTY and that SDDM is stopped using `sudo systemctl stop sddm`.

```bash
curl -Ls https://git.io/J6WSZ | sudo bash
```

Note: Some display managers are stubborn and won't boot into. If that's the case, run this in TTY5 (<kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>F5</kbd>):

```bash
sudo apt install sddm -y
sudo reboot
```

Note that you can select a display manager, but select your preferred display manager, but **EVERYTHING ELSE EXCEPT SDDM**.

Then run this in the terminal:
```bash
sudo apt remove sddm -y
```

## Interacting with Linux
webOS **does not come with a terminal app**. However, using TTY5, we can use the terminal. Press <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>F5</kbd>, and login with your SDDM credentials (the login screen). Now, you can run your Linux commands!
### GUI Apps
<hr>

Run:
```bash
DISPLAY=:0 <gui app> &
```
