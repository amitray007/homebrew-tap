# Homebrew formula TEMPLATE for the shelf CLI.
#
# This is a template — the release pipeline (.github/workflows/release.yml on a
# v* release) renders it (substituting 0.1.1 / https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.1/shelf-0.1.1.tgz / 26cb646ef28d58e4b6afec69cdbb17e495dbc8866073e5f0bc42fa3453472568) and
# pushes the result to amitray007/homebrew-tap as Formula/shelf.rb. Do NOT
# hand-edit the rendered formula in the tap — this template is the source.
#
# Install (once released):
#   brew tap amitray007/tap
#   brew install amitray007/tap/shelf
#
# The tarball is hosted on the PUBLIC homebrew-tap's own release (mirroring the
# silo pattern), so brew install works without auth regardless of whether the
# shelf source repo is public or private. The bundle inlines every runtime
# dependency except the optional native keyring; without it, profiles that use
# --credential-env work unchanged.
class Shelf < Formula
  desc "Publish, version, inspect, and share Shelf artifacts from the terminal"
  homepage "https://github.com/amitray007/shelf"
  version "0.1.1"
  url "https://github.com/amitray007/homebrew-tap/releases/download/shelf-v0.1.1/shelf-0.1.1.tgz"
  sha256 "26cb646ef28d58e4b6afec69cdbb17e495dbc8866073e5f0bc42fa3453472568"
  license "MIT"

  depends_on "node"

  def install
    # Tarball contains dist/ + package.json. Install into libexec, then expose
    # a launcher that runs the bundle with Homebrew's node.
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
