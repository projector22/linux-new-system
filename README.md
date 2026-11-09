# linux-new-system

A few basic tools & scripts to install on new Linux installs

## Setup

To run on new Linux installs

### Install

```bash
curl -fsSL https://raw.githubusercontent.com/projector22/linux-new-system/master/src/self/install.sh | bash
```

or

```bash
git clone https://github.com/projector22/linux-new-system.git
cd linux-new-system
bash src/self/install.sh
```

### Uninstall

```bash
curl -fsSL https://raw.githubusercontent.com/projector22/linux-new-system/master/src/self/install.sh | bash
```

## Arguments

### `--init`

#### Usage

```sh
lns --init
```

This tool initializes and installs all repositories used by LNS.

### `--clear`

#### Usage

```sh
lns --clear
```

This tool deletes any and all repos used by LNS.

### `--update`

#### Usage

```sh
lns --update
```

This tool performs an update by invoking a `git pull` on all the repos used by LNS.

### `--reset`

#### Usage

```sh
lns --reset
```

This tool deletes and reinitializes all the repos used by LNS

## Available Tools

### up

Called by invoking `up`. This will update a number of linux systems including `APT` (or `nala`), `SNAP`, `DNF / YUM`, `PACMAN`, `FLATPAK`, `Pi-hole` & `rclone`.

### update-plex

Called by invoking `update-plex`. Perform an upgrade to the `Plex Media Server`.

### MDL

Abstraction tool for spotdl and yt-dlp.

### Docker Update

Simple Script for updating docker containers.

## Extra Tooling

### PHP Version Helpers

If you have multiple PHP versions installed, this tool can be used to switch PHP versions.

```bash
chmod +x "$HOME"/.lns/src/php/php-version.sh && ln -s "$HOME"/.lns/src/php/php-version.sh "$HOME"/bin/php-version
chmod +x "$HOME"/.lns/src/php/phpv.sh && ln -s "$HOME"/.lns/src/php/phpv.sh "$HOME"/bin/phpv
```

### nv-top

A simple nvidia top project.

```bash
chmod +x "$HOME"/.lns/src/nv-top/nv-top.sh && ln -s "$HOME"/.lns/src/nv-top/nv-top.sh "$HOME"/bin/nv-top
```

### Plasma Tools

A tool for helping with KDE Plasma

```bash
chmod +x "$HOME"/.lns/src/plasma/plasma-restart.sh &&  ln -s "$HOME"/.lns/src/plasma/plasma-restart.sh "$HOME"/bin/plasma-restart
```

### mcd

Called by invoking either `. mcd newDirName` or `mcd newDirName` depending on setup, this function should be added to `~/.bashrc`. It allows the user to create a new directory and change to it in a single command.

### configure-git.sh

Called by invoking `sh configure-git.sh`. A quick way of setting the `name` and `email` attributes required to push to a git repository.


## Attribution

Gareth Palmer [Github](https://github.com/projector22), [Gitlab](https://gitlab.com/projector22).

I build this for my own use, but anyone is welcome to take and adapt the tools to their own purposes.
