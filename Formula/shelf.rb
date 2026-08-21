# Homebrew formula TEMPLATE for the shelf CLI.
#
# This is a template — the release pipeline (.github/workflows/release.yml)
# renders it (substituting 0.1.3 and the per-platform {{URL_*}} /
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
  version "0.1.3"
  license "MIT"

  depends_on "node"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.3/shelf-0.1.3-darwin-arm64.tgz"
      sha256 "9b8481d1b4649548efaee5743d924cc267d166aff94c097e9cf4ae5a4aa69325"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.3/shelf-0.1.3-darwin-x64.tgz"
      sha256 "d305a859abb5c7471710bb8101608c5845f16d71c0fb125c7df4d9d466e7bfac"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.3/shelf-0.1.3-linux-arm64-gnu.tgz"
      sha256 "7fc69d3af8abdcb17900b132b58cce2fa4d1c31cd6ad96f9ac2ccfb5def6b657"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.3/shelf-0.1.3-linux-x64-gnu.tgz"
      sha256 "5865677da2ebcb616e856d973afd776547569e4ca7e8d37a032da0ad28866265"
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
