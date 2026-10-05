cask "pushary" do
  version "0.1.70"
  sha256 "d4829f6736d78cef0011961ab03881de3be14018e2e076cee21c027a3626685c"

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
        "~/.pushary/run",
        "~/Library/Application Support/Pushary/com.pushary.app.mac.*",
        "~/Library/Caches/com.pushary.app",
        "~/Library/HTTPStorages/com.pushary.app",
        "~/Library/Preferences/com.pushary.app.plist",
      ]
end
