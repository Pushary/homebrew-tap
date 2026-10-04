cask "pushary" do
  version "0.1.66"
  sha256 "6cc16f53cdffde8664b3f5612aa40782589eecee47bf69896c1138d38ef87a1f"

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
