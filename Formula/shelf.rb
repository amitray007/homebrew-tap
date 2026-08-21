# Homebrew formula TEMPLATE for the shelf CLI.
#
# This is a template — the release pipeline (.github/workflows/release.yml)
# renders it (substituting 0.1.2 and the per-platform {{URL_*}} /
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
  version "0.1.2"
  license "MIT"

  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.2/shelf-0.1.2-darwin-arm64.tgz"
      sha256 "07a9c9da6a669259fa1dcbe82f8fd3c09932499ec1f17da6d4119f22ddecd0a7"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.2/shelf-0.1.2-darwin-x64.tgz"
      sha256 "dc3600c0d9f01460012cc45f1da0c74f58e5b54fda796ce7c8b488ec511679ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.2/shelf-0.1.2-linux-arm64-gnu.tgz"
      sha256 "43c4a3e9deaac29b7dcaec4d7e3ea3e8d44345e749421d913dec42e10c12e413"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.2/shelf-0.1.2-linux-x64-gnu.tgz"
      sha256 "1605fcedd0c6ecf836a45f3f5209cd3997f8ecb668638c6e5ab05a2f95873617"
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
