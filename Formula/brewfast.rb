# typed: strict
# frozen_string_literal: true

# Rendered by the release workflow; do not hand-edit.
class Brewfast < Formula
  desc "Accelerate Homebrew cask installs from throttled GitHub release assets"
  homepage "https://github.com/amitray007/brewfast"
  version "1.0.1"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.1/brewfast-1.0.1-darwin-arm64.tar.gz"
      sha256 "1aa030481ffd857f1429f0c87f5df0e400dfd1253cea660020d0e3c953bd562e"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.1/brewfast-1.0.1-darwin-x64.tar.gz"
      sha256 "38481d2e83d6d119f9b4718b5c0dce1b33123caa3ee8fcca54a061b9ef620b00"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.1/brewfast-1.0.1-linux-arm64.tar.gz"
      sha256 "4bffaabaab119866cf8b3e73ac2a3ff2761c528cf869c10259b4805be923173b"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.1/brewfast-1.0.1-linux-x64.tar.gz"
      sha256 "a2caeb7855409a00f68937579fb47d15acc204deb505623f652116fe7c30b881"
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
