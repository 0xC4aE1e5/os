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
curl -Ls https://codeberg.org/brahma/os/raw/branch/master/os/setup.sh | sudo bash
```
If you get `curl: not found` or similar, run `sudo apt install curl -y`, then try again.
### On Windows
Just download https://tinyurl.com/ionosinst, (Press Ctrl+S, replace txt with ps1, all files), right click and run with PowerShell
#### Dualbooting
Create a new user account (local account recommended, [I don't have this person's sign in info > Add without Microsoft account > add password so it doesn't autoboot]), login to the new account, then run the IonOS installer like above
### Manual install
<hr>
This is helpful when you need another distro, like Fedora on a Lenovo with Broadcom. You can install manually. First, you need wget, Git, Openbox, and Xsetroot. wget helps with installing Chromium. You might also want SDDM, for the login screen.

**Note**: If you wish to use SDDM, make sure it is the default display manager.

After install, run these commands:
```bash
pushd /tmp
sudo wget "https://download-chromium.appspot.com/dl/Linux_x64?type=snapshots" -O /tmp/chromium.zip
sudo unzip chromium.zip -d /opt
popd
pushd /
sudo git clone https://codeberg.org/brahma/os.git
sudo mv os osold
sudo mv osold/shell os
sudo rm -rf osold
popd
```
Also, edit `/etc/xdg/openbox/autostart` with your favorite text editor and put:
```bash
xsetroot -solid '#000000'
/opt/chrome-linux/chrome --kiosk file:///os/index.html
```

## Uninstall

Make sure you run this in the TTY and that SDDM is stopped using `sudo systemctl stop sddm`.

```bash
curl -Ls https://codeberg.org/brahma/os/raw/branch/master/os/remove.sh | sudo bash
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
OS **does not come with a terminal app**. However, using TTY5, we can use the terminal. Press <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>F5</kbd>, and login with your SDDM credentials (the login screen). Now, you can run your Linux commands!
### GUI Apps
<hr>

Run:
```bash
DISPLAY=:0 <gui app> &
```

## Interacting with Windows
The Windows key is all you need. Just press it.

## Switching minimized apps
Press <kbd>Alt</kbd>+<kbd>Tab</kbd>.