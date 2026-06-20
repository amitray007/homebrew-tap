cask "orpheus" do
  version "0.2.1"
  sha256 "b9e017f5f984c8fc9142dc7b8f35fe3c511072cfc5de6df6f67e7bd17a3be0ec"

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
