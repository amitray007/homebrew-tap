# typed: false
# frozen_string_literal: true

# Homebrew formula for the Tracks CLI and local viewer.
class Tracks < Formula
  desc "Local-first viewer and sharing tool for AI coding-agent sessions"
  homepage "https://github.com/amitray007/tracks"
  url "https://github.com/amitray007/homebrew-tap/releases/download/tracks-cli-v0.1.0/tracks-cli-0.1.0.tgz"
  version "0.1.0"
  sha256 "77c10e1ddbdee07cf0b967093f9eb3a5554824cfaf328fe68d57de8439fa49d0"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"tracks").write <<~SH
      #!/bin/bash
      exec "#{formula_opt_bin("node")}/node" "#{libexec}/dist/index.js" "$@"
    SH
    chmod 0555, bin/"tracks"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/tracks --version").strip
    assert_match "Tracks", shell_output("#{bin}/tracks --help")
  end
end
