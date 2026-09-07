cask "orpheus" do
  version "0.5.14"
  sha256 "cd947643ddbf1a0bc7964c2b4462097f199004741de84c9265e9388dfe900591"

  url "https://github.com/amitray007/homebrew-tap/releases/download/orpheus-v#{version}/orpheus-#{version}.dmg"
  name "Orpheus"
  desc "Mac IDE built around Claude Code"
  homepage "https://github.com/amitray007/orpheus"

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Orpheus.app"

  # Symlinks the in-bundle CLI shim onto PATH (brew manages the link: created on
  # install, re-pointed on upgrade, removed on uninstall — no privilege prompt).
  # Path must match electron-builder.yml's extraResources mapping for
  # resources/bin/orpheus -> Contents/Resources/bin/orpheus; if that mapping ever
  # moves, update this line too or the symlink dangles.
  binary "#{appdir}/Orpheus.app/Contents/Resources/bin/orpheus"

  # Strip quarantine + re-sign ad-hoc after install so macOS 15+ accepts the bundle.
  # electron-builder leaves inner frameworks with mismatched Team IDs;
  # a unified ad-hoc re-sign normalises them.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Orpheus.app"],
        writable_paths: ["Orpheus.app"],
        writable_base: :appdir
    run "/usr/bin/codesign",
        args: ["--force", "--deep", "--sign", "-", "{{appdir}}/Orpheus.app"],
        writable_paths: ["Orpheus.app"],
        writable_base: :appdir
  end

  zap trash: [
    "~/Library/Application Support/Orpheus",
    "~/Library/Preferences/dev.orpheus.app.plist",
    "~/Library/Logs/Orpheus",
    "~/Library/Caches/dev.orpheus.app",
    "~/Library/Saved Application State/dev.orpheus.app.savedState",
  ]
end
