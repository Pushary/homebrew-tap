cask "pushary" do
  version "0.1.73"
  sha256 "fb7ed748452cccc44f692abf57e8ca3f542c7b6fa3f42e8dbe17886b2d3e9b36"

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
