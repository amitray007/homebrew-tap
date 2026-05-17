cask "orpheus" do
  version "0.0.1"
  sha256 "4d265f2514e5c6f37ae1915d16e31d72cf29b084cafe2ebdf02bfee988005e22"

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
