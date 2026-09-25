cask "pushary" do
  version "0.1.52"
  sha256 "74361a2f4f38e26a28c1725297c20df731ca1c08cf0cff32dc2b7a3048f2ef8c"

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
