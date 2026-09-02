cask "pace" do
  version "0.1.0"
  sha256 "7e6e503af4efab1f2f7a473f4517a23cad4207e5e3d694eeee2244f992b90adb"

  url "https://github.com/amitray007/homebrew-tap/releases/download/pace-v#{version}/Pace-#{version}-2-macos-universal-unsigned.zip",
      verified: "github.com/amitray007/homebrew-tap/"
  name "Pace"
  desc "Menu-bar monitor for AI provider usage limits"
  homepage "https://github.com/amitray007/pace"

  depends_on macos: :sequoia

  app "Pace.app"

  # Pace has no Apple Developer ID behind it, so the download is quarantined
  # and unsigned. Stripping the quarantine flag and applying an ad-hoc
  # signature is what lets macOS 15+ open the bundle. Neither step needs
  # elevated privileges.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Pace.app"],
                   sudo: false
    system_command "/usr/bin/codesign",
                   args: ["--force", "--deep", "--sign", "-", "#{appdir}/Pace.app"],
                   sudo: false
  end

  uninstall quit: "com.amitray.Pace"

  zap trash: [
    "~/Library/Application Support/Pace",
    "~/Library/Caches/com.amitray.Pace",
    "~/Library/Saved Application State/com.amitray.Pace.savedState",
  ]
end
