cask "orpheus" do
  version "0.3.0"
  sha256 "ad643d2f839cf95818d6113ba12128b80c315ebbb1bc69fe9116ad80a31bb94d"

  url "https://github.com/amitray007/homebrew-tap/releases/download/orpheus-v#{version}/orpheus-#{version}.dmg",
      verified: "github.com/amitray007/homebrew-tap/"
  name "Orpheus"
  desc "Mac IDE built around Claude Code"
  homepage "https://github.com/amitray007/orpheus"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Orpheus.app"

  # Strip quarantine + re-sign ad-hoc after install so macOS 15+ accepts the bundle.
  # electron-builder leaves inner frameworks with mismatched Team IDs;
  # a unified ad-hoc re-sign normalises them.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Orpheus.app"],
                   sudo: false
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/Orpheus.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Orpheus",
    "~/Library/Preferences/dev.orpheus.app.plist",
    "~/Library/Logs/Orpheus",
    "~/Library/Caches/dev.orpheus.app",
    "~/Library/Saved Application State/dev.orpheus.app.savedState",
  ]
end
