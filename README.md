# homebrew-tap

Public Homebrew tap for [@amitray007](https://github.com/amitray007)'s personal apps.

## Install

```sh
brew tap amitray007/tap

# GUI apps (casks)
brew install --cask orpheus
brew install --cask pace

# Nightly channel — installs alongside stable, does not replace it
brew install --cask orpheus-nightly

# CLI tools (formulae)
brew install amitray007/tap/silo
brew install amitray007/tap/tracks
brew install amitray007/tap/ccstack
brew install amitray007/tap/loco
brew install amitray007/tap/brewfast
brew install amitray007/tap/shelf
```

## Upgrade

```sh
brew upgrade --cask orpheus              # apps
brew upgrade --cask orpheus-nightly      # nightly channel
brew upgrade --cask pace                 # menu-bar apps
brew upgrade silo tracks ccstack loco brewfast shelf  # CLIs
```

## Casks

Mac GUI apps.

| Cask              | What it is                                              |
| ----------------- | ------------------------------------------------------- |
| `orpheus`         | Mac IDE built around Claude Code                        |
| `orpheus-nightly` | Nightly channel for the Orpheus Mac IDE                  |
| `pace`            | Menu-bar monitor for AI provider usage limits            |

## Formulae

Command-line tools.

| Formula    | What it is                                                        |
| ---------- | ----------------------------------------------------------------- |
| `silo`     | Terminal client for silo: capture, search, and open links          |
| `tracks`   | Local-first viewer for AI coding-agent sessions                    |
| `ccstack`  | Claude Code configuration control surface                          |
| `loco`     | Durable cron, service runner, and event bus                         |
| `brewfast` | Faster GitHub-asset Homebrew downloads through aria2                |
| `shelf`    | Publish, version, inspect, and share Shelf artifacts                |

## How the tap is updated

Cask/formula files and release binaries are generated and pushed here automatically by each app's release pipeline. Don't hand-edit them — the next release will overwrite them.

## Contributing

External contributions are not accepted. Do not open pull requests or issues.
