# linux-new-system

## Setup

To run on new Linux installs

```bash
git clone https://github.com/projector22/linux-new-system.git .
```

## Tools

### up

Called by invoking `up`. This will update a number of linux systems including `APT`, `SNAP`, `YUM`, `FLATPAK` & `Pi-hole`.

### mcd

Called by invoking either `. mcd newDirName` or `mcd newDirName` depending on setup, this function should be added to `~/.bashrc`. It allows the user to create a new directory and change to it in a single command.

### clone-project

Called by invoking `clone-project`, this functions as a shortcut to cloning of a number of my most used projects.

Currently the projects are:

- [Lourie Registration System](https://gitlab.com/projector22/lourie-registration-system)
- [Albatross School Counsellor Booking System](https://gitlab.com/projector22/albatross-school-counsellor-booking-system)
- [Active Directory Tools](https://gitlab.com/projector22/active-directory-tools)
- [Marks Email System](https://gitlab.com/projector22/marks-email-system)
- [Linux New System](https://github.com/projector22/linux-new-system)
- [Lourie Basic Framework](https://gitlab.com/projector22/lourie-basic-framework)

### configure-git.sh

Called by invoking `sh configure-git.sh`. A quick way of setting the `name` and `email` attributes required to push to a git repository.

### new_system.sh

Called by invoking `sh new_system.sh`. It calles a number of installers and runs them, useful for a new system.

Status is _Alpha_

### setup-dev-env.sh

Called by invoking `sh set-dev-env.sh` to set up the LAMP stack for developement purposes including a number of configurations.

Tools include

- Apache2
- MySQL Server
- PHP 8.1
- PHPMyAdmin
- git
- SSH

Status is _Beta_

### rsy

Called by invoking `rsy`, this tool reloads the `synergy` service.

### update-lrs-live

Called by invoking `update-lrs-live`. This tool updates the branch `prod-dist` from `master` on the repository `Lourie Registration System`. It assumes you have a copy of the repository cloned to the home directory with pushing right.

### wsl-lamp

Called by invoking `wsl-lamp --arguement`. A tool for performing a number of operations with the services `apache2` & `mysql`.

Possible arguments:

- `--start` - Start the services.
- `--stop` - Stop the services.
- `--restart` - Restart the services.

## Attribution

Gareth Palmer [Github](https://github.com/projector22), [Gitlab](https://gitlab.com/projector22).

I build this for my own use, but anyone is welcome to take and adapt the tools to their own purposes.
