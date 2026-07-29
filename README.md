# homebrew-tap

Public Homebrew tap for [@amitray007](https://github.com/amitray007)'s personal apps.

## Install

```sh
brew tap amitray007/tap

# GUI apps (casks)
brew install --cask orpheus

# Nightly channel — installs alongside stable, does not replace it
brew install --cask orpheus-nightly

# CLI tools (formulae)
brew install amitray007/tap/silo
brew install amitray007/tap/tracks
brew install amitray007/tap/ccstack
brew install amitray007/tap/loco
```

## Upgrade

```sh
brew upgrade --cask orpheus              # apps
brew upgrade --cask orpheus-nightly      # nightly channel
brew upgrade silo tracks ccstack loco    # CLIs
```

## Casks

Mac GUI apps.

| Cask               | What it is                                        |
| ------------------ | ------------------------------------------------- |
| `orpheus`          | Mac IDE built around Claude Code                   |
| `orpheus-nightly`  | Orpheus nightly channel, built on demand from `staging` |

`orpheus-nightly` is a **separate app**, not an upgrade path for `orpheus`. It
installs as `Orpheus Nightly.app` with its own bundle id and its own data
directory (`~/Library/Application Support/Orpheus Nightly`), so it never reads
or writes a stable install's database. The two are meant to run side by side.

## Formulae

Command-line tools.

| Formula   | What it is                                            |
| --------- | ----------------------------------------------------- |
| `silo`    | Terminal client for silo — capture, search, open links |
| `tracks`  | Local-first viewer for AI coding-agent sessions        |
| `ccstack` | Claude Code configuration control surface              |
| `loco`    | Local Operator: durable cron + service runner and event bus |

## How the tap is updated

Cask/formula files and release binaries are generated and pushed here automatically by each app's release pipeline. Don't hand-edit them — the next release will overwrite them.

## Contributing

External contributions are not accepted. Do not open pull requests or issues.
