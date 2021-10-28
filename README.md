# webOS
webOS is a tiny OS written for the web, in the web. It's very similar to ChromeOS, but with less requirements.
## Install
### Recommended system requirements
- Any CPU
- 3 gigabytes of RAM
- 10 gigabytes of disk space (base: Ubuntu 20.04 using minimal install)
- Internet access

Depending on the distro you plan to install with (first is an Ubuntu-based distro, and then install webOS on top of that), the requirements may be different. Refer to the distro's system requirements if you are not using Ubuntu, for example you're using Linux Mint or Xubuntu instead.
<hr>

If you meet the minimum requirements, run this command in the terminal:

```bash
curl -Ls https://git.io/JnaUB | sudo bash
```

## Uninstall

Make sure you run this in the TTY and that SDDM is stopped using `sudo systemctl stop sddm`.

```bash
curl -Ls https://git.io/J6WSZ | sudo bash
```

Note: Some display managers are stubborn and won't boot into. If that's the case, run this in TTY5:

```bash
sudo apt install sddm -y
sudo reboot
```

Note that you can select a display manager, but select your preferred display manager, but **EVERYTHING ELSE EXCEPT SDDM**.

Then run this in the terminal:
```bash
sudo apt remove sddm -y
```
