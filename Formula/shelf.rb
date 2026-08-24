# Homebrew formula TEMPLATE for the shelf CLI.
#
# This is a template — the release pipeline (.github/workflows/release.yml)
# renders it (substituting 0.1.5 and the per-platform {{URL_*}} /
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
  version "0.1.5"
  license "MIT"

  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.5/shelf-0.1.5-darwin-arm64.tgz"
      sha256 "348a3d9c657d63fa0cb7539ee2edb64a65041e6b2267b0c7822557045617f091"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.5/shelf-0.1.5-darwin-x64.tgz"
      sha256 "65461d09a09d9df77f1f474e1914b7e51759e8f0f03e0446b8b39588f4b90f12"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.5/shelf-0.1.5-linux-arm64-gnu.tgz"
      sha256 "067cf750c43a238865dd183582a44b390d7dcb6446ade697f8554371a2babca4"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.5/shelf-0.1.5-linux-x64-gnu.tgz"
      sha256 "3bbdd9d923c4f3ec62ba0f397bfb7cb94366dba333cc5f3e8bdc3a04d96f050d"
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
