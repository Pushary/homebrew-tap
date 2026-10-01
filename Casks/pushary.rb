cask "pushary" do
  version "0.1.60"
  sha256 "e0fce7e28f8608c4721f428a43eb883ede2228a3c5793f776eeee96893099015"

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

  zap trash: [
    "~/.pushary/run",
    "~/Library/Application Support/Pushary/com.pushary.app.mac.*",
    "~/Library/Caches/com.pushary.app",
    "~/Library/HTTPStorages/com.pushary.app",
    "~/Library/Preferences/com.pushary.app.plist",
  ]
end
