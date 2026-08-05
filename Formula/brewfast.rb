# typed: strict
# frozen_string_literal: true

# Rendered by the release workflow; do not hand-edit.
class Brewfast < Formula
  desc "Accelerate Homebrew cask installs from throttled GitHub release assets"
  homepage "https://github.com/amitray007/brewfast"
  version "1.0.4"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.4/brewfast-1.0.4-darwin-arm64.tar.gz"
      sha256 "7faa81a65dc2841a81784dafe85d25c391aece6929145e1531370f5d38d03c7d"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.4/brewfast-1.0.4-darwin-x64.tar.gz"
      sha256 "2750961d95c1f9302bd3143321c2ccb47aa4989cd368e263967dba3d790c7873"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.4/brewfast-1.0.4-linux-arm64.tar.gz"
      sha256 "94dbcb8e923bb5d6b61100e54153f3d580db3d518231f46812f56b51139d59d4"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.4/brewfast-1.0.4-linux-x64.tar.gz"
      sha256 "f54c1636bc1ef834b3a2be1cea3f38f059d6428eb237b1d4a63748188fc3c8b2"
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
