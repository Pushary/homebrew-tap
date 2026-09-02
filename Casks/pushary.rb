cask "pushary" do
  version "0.1.11"
  sha256 "f3faa8f9103035afedc80fb5a5ab77ffbdbf99bf0a5d758a8212777483572789"

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

  uninstall quit: "com.pushary.app"

  zap trash: [
    "~/.pushary/bin/.bridge-cache",
    "~/.pushary/bin/pushary-bridge",
    "~/.pushary/run",
    "~/Library/Application Support/Pushary/com.pushary.app.mac.*",
    "~/Library/Caches/com.pushary.app",
    "~/Library/HTTPStorages/com.pushary.app",
    "~/Library/Preferences/com.pushary.app.plist",
  ]
end
