# typed: strict
# frozen_string_literal: true

# Rendered by the release workflow; do not hand-edit.
class Brewfast < Formula
  desc "Accelerate Homebrew cask installs from throttled GitHub release assets"
  homepage "https://github.com/amitray007/brewfast"
  version "1.0.2"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.2/brewfast-1.0.2-darwin-arm64.tar.gz"
      sha256 "a4dbd2a5c6c86fb34dfbcb948e0fc82d90aeb093ca11eb3483d1fa813e33bb9e"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.2/brewfast-1.0.2-darwin-x64.tar.gz"
      sha256 "5449b21530ee3f88bb6e3178d4c839411e50aa342b28517a3a6115a47b3c0cb6"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.2/brewfast-1.0.2-linux-arm64.tar.gz"
      sha256 "cac900a20510b9e4a6ca7916c9010dde27d3f8287c58a605cee9b8ee9774372c"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.2/brewfast-1.0.2-linux-x64.tar.gz"
      sha256 "012cd17015a93510b9b2dfa523bf314e08eb89984523a66713ccddbcc6db890f"
    end
  end

  def install
    bin.install "brewfast"
  end

  test do
    assert_equal "brewfast #{version}", shell_output("#{bin}/brewfast --version").strip
    assert_match "brewfast", shell_output("#{bin}/brewfast --help")
  end
end
