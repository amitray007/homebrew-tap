cask "orpheus-nightly" do
  version "0.5.7-nightly.20260729.5501f06c"
  sha256 "00d7a3de98cb731d46284f15a88511a3b6e9b6d7512fd104c58b7c9a780a1595"

  url "https://github.com/amitray007/homebrew-tap/releases/download/orpheus-nightly-v#{version}/orpheus-nightly-#{version}.dmg",
      verified: "github.com/amitray007/homebrew-tap/"
  name "Orpheus Nightly"
  desc "Mac IDE built around Claude Code (nightly channel)"
  homepage "https://github.com/amitray007/orpheus"

  # Nightly is a separate app from the stable `orpheus` cask: its own bundle id
  # (dev.orpheus.nightly) and its own data dir (~/Library/Application Support/
  # Orpheus Nightly), so installing it never touches a stable install or its
  # sqlite database. The two are intended to coexist.
  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Orpheus Nightly.app"

  # Strip quarantine + re-sign ad-hoc after install so macOS 15+ accepts the bundle.
  # electron-builder leaves inner frameworks with mismatched Team IDs;
  # a unified ad-hoc re-sign normalises them.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Orpheus Nightly.app"],
                   sudo: false
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/Orpheus Nightly.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Orpheus Nightly",
    "~/Library/Preferences/dev.orpheus.nightly.plist",
    "~/Library/Logs/Orpheus Nightly",
    "~/Library/Caches/dev.orpheus.nightly",
    "~/Library/Saved Application State/dev.orpheus.nightly.savedState",
  ]
end
