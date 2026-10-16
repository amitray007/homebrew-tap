# Homebrew formula TEMPLATE for the shelf CLI.
#
# This is a template — the release pipeline (.github/workflows/release.yml)
# renders it (substituting 0.1.7 and the per-platform {{URL_*}} /
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
  version "0.1.7"
  license "MIT"

  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.7/shelf-0.1.7-darwin-arm64.tgz"
      sha256 "1f79a28cedef6e0da706a772bb336919a5a67c0640b965a6aefd5e34127f78c5"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.7/shelf-0.1.7-darwin-x64.tgz"
      sha256 "b44b8fb836406930829271c07eb86aaf966d3c62dd458155f8d134cb59a05573"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.7/shelf-0.1.7-linux-arm64-gnu.tgz"
      sha256 "6b2af4f05241d5064ca05c7c1233654923bc0ff703470c84bb88f53dcd499261"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.7/shelf-0.1.7-linux-x64-gnu.tgz"
      sha256 "be2c528d2a948046540a0dfea4ea25d3b9525e016f77dc0674f155f192091724"
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
