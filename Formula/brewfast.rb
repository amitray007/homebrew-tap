# typed: strict
# frozen_string_literal: true

# Rendered by the release workflow; do not hand-edit.
class Brewfast < Formula
  desc "Accelerate Homebrew cask installs from throttled GitHub release assets"
  homepage "https://github.com/amitray007/brewfast"
  version "1.0.3"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.3/brewfast-1.0.3-darwin-arm64.tar.gz"
      sha256 "12ff1fa6c7cbfbda6406ff16ab116483eb6f62bf72da927486443828ae75f48d"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.3/brewfast-1.0.3-darwin-x64.tar.gz"
      sha256 "935e19329aaaaa9bde13b6b70d5e42b78e0ed1b0921cf079fccad0c033904513"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.3/brewfast-1.0.3-linux-arm64.tar.gz"
      sha256 "181599914e31ae51d5e2775657940599b8769619c9a29edc439c5ca75af05202"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.3/brewfast-1.0.3-linux-x64.tar.gz"
      sha256 "3df8f4d165b76a2ac04c69450172739f820561d996417f55bc1edd76997dafcf"
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
