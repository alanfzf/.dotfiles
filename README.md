# Dot files

This repository contains some configuration files that i use to personalize my environment.

## Linux setup

```bash
bash <(curl -s https://alanfzf.github.io/dotfiles/scripts/linux.sh)
```

## Windows Setup

```powershell
winget configure -f https://raw.githubusercontent.com/alanfzf/.dotfiles/refs/heads/main/config/configuration.winget --accept-configuration-agreements --disable-interactivity
```

### WSL setup

```powershell
# install WSL
wsl.exe --install --no-distribution
```
