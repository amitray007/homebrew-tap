cask "orpheus" do
  version "0.2.0"
  sha256 "616dd1990750a0159bf55bf081348e94707dd9e387049b16922448a5259f5ea5"

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
