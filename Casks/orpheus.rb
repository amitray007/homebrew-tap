cask "orpheus" do
  version "0.1.0"
  sha256 "3e1407587b2b2afec4dfae8ae1633bb431e71ae61ec3eed49f65769a8d5ba6f9"

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
