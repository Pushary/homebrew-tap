# Pushary tap

Pushary for Mac: approvals and questions from your AI agents, at the top of the screen.

Sign in and pick a plan, and the app sets up Claude Code, Codex, Cursor, Gemini CLI, Hermes and the other agents it supports. When an agent needs a yes or an answer, it shows in the notch, and on your phone when you step away. Plans start at $9.99 a month after a 3-day trial: [pricing](https://pushary.com/pricing?utm_source=github&utm_medium=oss-adapter&utm_campaign=homebrew-tap&utm_content=readme). [About the Mac app](https://pushary.com/mac-notch-app?utm_source=github&utm_medium=oss-adapter&utm_campaign=homebrew-tap&utm_content=readme) · [Mac app guide](https://pushary.com/docs/agents/mac-app?utm_source=github&utm_medium=oss-adapter&utm_campaign=homebrew-tap&utm_content=readme)

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

That quits the app, disconnects it from every agent it wired, and removes it.
Disconnecting first is the point: the hooks it writes name a file in your home
directory rather than one inside the bundle, so deleting the app alone would
leave every agent calling a path with nothing behind it. Its launch-at-login
registration goes with the bundle, because the app registers through
`SMAppService` rather than as a login item.

To take its data too:

```
brew uninstall --zap --cask pushary
```

The zap also revokes this Mac's Pushary device key on pushary.com and then
deletes the local copy. If pushary.com cannot be reached, the uninstall still
finishes and says the key is still active. A plain `brew uninstall` does not
revoke it, because Homebrew runs the same uninstall step on every
`brew upgrade` and `brew reinstall`, and an upgrade must not sign the Mac out.

The zap leaves `~/.pushary/config.json` alone, because that is the CLI's
credential, not the app's. Hooks you wired with the Pushary CLI rather than with
this app are also left alone; run `npx -y pushary@latest clean` to remove
those.

## This file is generated

The cask and this README are rendered by `apps/macos/scripts/publish-cask.sh` in
the Pushary monorepo and pushed here by the `macos/v*` release workflow. Edits
made directly to this repository are overwritten by the next release.
