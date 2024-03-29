# Linux New System

## v0.1.5 - 2023-01-08

### Added

- Added the installing and updating of `SPOTDLL` pip3 requirements.

### Changed

- Added a catch for unlinking Symlinks only if they exist.

### Removed

- Removed `spotdll.json` as a linked file.

---

## v0.1.4 - 2023-01-02

### Added

- Added tool `reimagined-bassoon` for the purpose of installing.

### Removed

- `archive/new_system.sh`.

---

## v0.1.3 - 2022-12-31

### Changed

- Added an instruction to clone any new projects in when performing updates.

---

## v0.1.2 - 2022-12-31

### Added

- Added `rebase`.

---

## v0.1.1 - 2022-12-31

### Added

- Added param to do a basic full factory reset to redownload all the LNS apps.

---

## v0.1.0 - 2022-12-31

### Added

- Semantic versioning, starting with v0.1.0
- Added tool `spotdll`.
- Added a basic set of tools to a single script `lns`, specifically
  - `--init`
  - `--clear`
  - `--update`

### Change

- Moved the following to their own Repositories:
  - `up`
  - `wsl-lamp` (now just `lamp`)
  - `update-plex`
  - `update-lrs-live`

### Issues Closed

- #7
