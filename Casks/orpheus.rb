cask "orpheus" do
  version "0.0.2"
  sha256 "11702ded9328379bad0b638d9328748028c193198e9337ac0fd79f0cd36398a4"

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
