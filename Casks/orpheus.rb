cask "orpheus" do
  version "0.2.0"
  sha256 "cf1b6124b9fb6d7dd209aa66013c8ad3530863f1f097f8203eb8eebd1c63f761"

  url "https://github.com/amitray007/orpheus/releases/download/v#{version}/orpheus-#{version}.dmg",
      verified: "github.com/amitray007/orpheus/"
  name "Orpheus"
  desc "Mac IDE built around Claude Code"
  homepage "https://github.com/amitray007/orpheus"

  depends_on arch: :arm64
  depends_on macos: ">= :sonoma"

  app "Orpheus.app"

  zap trash: [
    "~/Library/Application Support/Orpheus",
    "~/Library/Preferences/dev.orpheus.app.plist",
    "~/Library/Logs/Orpheus",
    "~/Library/Caches/dev.orpheus.app",
    "~/Library/Saved Application State/dev.orpheus.app.savedState",
  ]
end
