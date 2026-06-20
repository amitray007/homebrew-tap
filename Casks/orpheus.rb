cask "orpheus" do
  version "0.2.1"
  sha256 "df66c7e96542f157192db5c4810112041725f8a4c10ba4db7a453fb2e4bf4886"

  url "https://github.com/amitray007/homebrew-tap/releases/download/orpheus-v#{version}/orpheus-#{version}.dmg",
      verified: "github.com/amitray007/homebrew-tap/"
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
