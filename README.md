# Pushary tap

Pushary for Mac: approvals for your AI coding agents, at the top of the screen.

```
brew install --cask pushary/tap/pushary
```

The app is signed with a Developer ID, notarised, and stapled. It needs macOS 14
or later.

## What the cask installs

`Pushary.app` from the disk image published on
[Pushary/pushary-mac](https://github.com/Pushary/pushary-mac/releases). The same
image the website links, with the same checksum.

## Updates

The app updates itself through Sparkle, so `auto_updates true` is set and
`brew upgrade` does not fight it. To pin yourself to whatever Homebrew last
served, turn automatic checks off in the app's settings.

## Uninstalling

```
brew uninstall --cask pushary
```

That removes the app and its login item. To take its data with it:

```
brew uninstall --zap --cask pushary
```

The zap leaves `~/.pushary/config.json` alone, because that is the CLI's
credential, not the app's. Hooks the app wired into your agents stay wired; run
`npx @pushary/agent-hooks clean` to remove those.

## This file is generated

The cask and this README are rendered by `apps/macos/scripts/publish-cask.sh` in
the Pushary monorepo and pushed here by the `macos/v*` release workflow. Edits
made directly to this repository are overwritten by the next release.
