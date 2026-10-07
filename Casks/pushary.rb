cask "pushary" do
  version "0.1.81"
  sha256 "f76c41bb26acfcbb013efabfdc96ec6b6ac6bd07ee46b1390c2369db8ab88a85"

  url "https://github.com/Pushary/pushary-mac/releases/download/v#{version}/Pushary.dmg"
  name "Pushary"
  desc "Approvals and notifications for AI coding agents, in the notch"
  homepage "https://pushary.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Pushary.app"

  uninstall quit: "com.pushary.app",
            script: {
              executable:   "#{appdir}/Pushary.app/Contents/Helpers/pushary-bridge",
              args:         ["--disconnect"],
              must_succeed: false,
            }

  zap script: {
        executable:   "Pushary.app/Contents/Helpers/pushary-bridge",
        args:         ["--revoke-device-key"],
        must_succeed: false,
      },
      trash:  [
        "~/.pushary/native-transcript-consent.json",
        "~/.pushary/native-transcripts",
        "~/.pushary/run",
        "~/Library/Application Support/Pushary/com.pushary.app.mac.*",
        "~/Library/Caches/com.pushary.app",
        "~/Library/HTTPStorages/com.pushary.app",
        "~/Library/Preferences/com.pushary.app.plist",
      ]
end
