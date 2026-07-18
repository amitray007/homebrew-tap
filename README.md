# homebrew-tap

Public Homebrew tap for [@amitray007](https://github.com/amitray007)'s personal apps.

## Install

```sh
brew tap amitray007/tap

# GUI apps (casks)
brew install --cask orpheus

# CLI tools (formulae)
brew install amitray007/tap/silo
brew install amitray007/tap/tracks
```

## Upgrade

```sh
brew upgrade --cask orpheus   # apps
brew upgrade silo tracks      # CLIs
```

## Casks

Mac GUI apps.

| Cask      | What it is                       |
| --------- | -------------------------------- |
| `orpheus` | Mac IDE built around Claude Code |

## Formulae

Command-line tools.

| Formula  | What it is                                             |
| -------- | ------------------------------------------------------ |
| `silo`   | Terminal client for silo — capture, search, open links  |
| `tracks` | Local-first viewer for AI coding-agent sessions         |

## How the tap is updated

Cask/formula files and release binaries are generated and pushed here automatically by each app's release pipeline. Don't hand-edit them — the next release will overwrite them.

## Contributing

External contributions are not accepted. Do not open pull requests or issues.
