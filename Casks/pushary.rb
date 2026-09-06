cask "pushary" do
  version "0.1.23"
  sha256 "7c24ce21a16ad668a1ddcda28457c3415a4233b379ddf6ddb4392f892e020375"

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
