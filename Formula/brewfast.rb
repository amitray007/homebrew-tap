# typed: strict
# frozen_string_literal: true

# Rendered by the release workflow; do not hand-edit.
class Brewfast < Formula
  desc "Accelerate Homebrew cask installs from throttled GitHub release assets"
  homepage "https://github.com/amitray007/brewfast"
  version "1.0.0"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.0/brewfast-1.0.0-darwin-arm64.tar.gz"
      sha256 "882aadaf04ef29c3c12073fa4425bc22f83ab364dcc02fe66119a0b26cb21473"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.0/brewfast-1.0.0-darwin-x64.tar.gz"
      sha256 "a07db5cfa01f5d9a20a2776c9cb65ab949c45e4326df5f26e34005029e06885b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.0/brewfast-1.0.0-linux-arm64.tar.gz"
      sha256 "0eeb883e9403c4407e5caaf071074d8de9e86f33f148a32a4c9618e0cbd1a1dd"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.0/brewfast-1.0.0-linux-x64.tar.gz"
      sha256 "a8efd098b2ded0318d67a7a12b692a96655dff7006f54dc76ce99e995d36966c"
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
