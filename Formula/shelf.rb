# Homebrew formula TEMPLATE for the shelf CLI.
#
# This is a template — the release pipeline (.github/workflows/release.yml)
# renders it (substituting 0.1.8 and the per-platform {{URL_*}} /
# {{SHA_*}} pairs) and pushes the result to amitray007/homebrew-tap as
# Formula/shelf.rb. Do NOT hand-edit the rendered formula in the tap — this
# template is the source.
#
# Install (once released):
#   brew tap amitray007/tap
#   brew install amitray007/tap/shelf
#
# Tarballs are hosted on the PUBLIC homebrew-tap's own release (mirroring the
# silo pattern), so brew install works without auth regardless of whether the
# shelf source repo is public or private. Each tarball carries the platform's
# own prebuilt keyring binary, so --store-token-from-env stores credentials in
# the macOS Keychain or the Linux Secret Service out of the box.
class Shelf < Formula
  desc "Publish, version, inspect, and share Shelf artifacts from the terminal"
  homepage "https://github.com/amitray007/shelf"
  version "0.1.8"
  license "MIT"

  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.8/shelf-0.1.8-darwin-arm64.tgz"
      sha256 "32f80267267076542dac308a699d6a152053ca47434ef8f2af0b6369bab08373"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.8/shelf-0.1.8-darwin-x64.tgz"
      sha256 "43ee347f135849db3c63318124a63bb245792d1cab83e80546badbb91d76361d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.8/shelf-0.1.8-linux-arm64-gnu.tgz"
      sha256 "c9875fba379a35cfdc24cd46394d44a135c14b01404453b630642e48e9ee1931"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.8/shelf-0.1.8-linux-x64-gnu.tgz"
      sha256 "66ec175c88eb59bd2b4b81a89a769cf909ba8c09534a7bc74318225b3f9cb24f"
    end
  end

  def install
    # Tarball contains dist/ + node_modules/ + package.json. Install into
    # libexec, then expose a launcher that runs the bundle with Homebrew's
    # node.
    libexec.install Dir["*"]
    (bin/"shelf").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/dist/shelf.js" "$@"
    SH
    chmod 0555, bin/"shelf"
  end

  test do
    assert_match "Publish, version, inspect, and share", shell_output("#{bin}/shelf --help")
    assert_match version.to_s, shell_output("#{bin}/shelf --version")
  end
end
