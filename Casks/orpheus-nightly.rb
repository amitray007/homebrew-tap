cask "orpheus-nightly" do
  version "0.5.9-nightly.20260731.fd168d0d"
  sha256 "8eba37e48d1cd07ac4e7705c893d5d251ef8dbf6cd5d1a47b6e815dd3b618fb2"

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
