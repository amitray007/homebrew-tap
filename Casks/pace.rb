cask "pace" do
  version "0.1.1"
  sha256 "fc93958f63eb6686cf474220a8648c17bfc0115e68d2a21f5ed3cb08046973e2"

  url "https://github.com/amitray007/homebrew-tap/releases/download/pace-v#{version}/Pace-#{version}-3-macos-universal-unsigned.zip"
  name "Pace"
  desc "Menu-bar monitor for AI provider usage limits"
  homepage "https://github.com/amitray007/pace"

  depends_on macos: :sequoia

  app "Pace.app"

  # Pace has no Apple Developer ID behind it, so the download is quarantined
  # and unsigned. Stripping the quarantine flag and applying an ad-hoc
  # signature is what lets macOS 15+ open the bundle. Neither step needs
  # elevated privileges.
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Pace.app"],
        writable_paths: ["Pace.app"],
        writable_base: :appdir
    run "/usr/bin/codesign",
        args: ["--force", "--deep", "--sign", "-", "{{appdir}}/Pace.app"],
        writable_paths: ["Pace.app"],
        writable_base: :appdir
  end

  uninstall quit: "com.amitray.Pace"

  zap trash: [
    "~/Library/Application Support/Pace",
    "~/Library/Caches/com.amitray.Pace",
    "~/Library/Saved Application State/com.amitray.Pace.savedState",
  ]
end
