# homebrew-tap

Private Homebrew tap for [@amitray007](https://github.com/amitray007)'s personal apps.

The tap is private; both the cask metadata here and the binary releases on the
source repos sit behind GitHub auth. To install from this tap you need a
GitHub token visible to Homebrew via the `HOMEBREW_GITHUB_API_TOKEN` env var.

## Setup (one time per machine)

```sh
# A token Homebrew can use to read this private tap + private releases.
# `gh auth token` reuses whatever is already set up via `gh auth login`.
export HOMEBREW_GITHUB_API_TOKEN="$(gh auth token)"

# Persist it across shells.
echo 'export HOMEBREW_GITHUB_API_TOKEN="$(gh auth token)"' >> ~/.zshrc

brew tap amitray007/tap
```

## Apps

| Cask      | Source                                                       | What it is                            |
| --------- | ------------------------------------------------------------ | ------------------------------------- |
| `orpheus` | [amitray007/orpheus](https://github.com/amitray007/orpheus)  | Mac IDE built around Claude Code     |

Install:

```sh
brew install --cask orpheus
```

Upgrade:

```sh
brew upgrade --cask orpheus
```

Uninstall:

```sh
brew uninstall --cask orpheus
```

## How the tap is updated

The cask files here are generated and pushed by each app's release pipeline
— either `bun run release` locally or the `Release` GitHub Action on the
source repo. Each app's `.dmg` lives on that app's own source repo's
GitHub Releases; this tap just points cask URLs at them.

Don't hand-edit cask files unless you're patching a bad release — the next
`release` run will overwrite them.
