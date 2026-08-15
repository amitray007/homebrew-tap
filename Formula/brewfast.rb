# typed: strict
# frozen_string_literal: true

# Rendered by the release workflow; do not hand-edit.
class Brewfast < Formula
  desc "Accelerate Homebrew cask installs from throttled GitHub release assets"
  homepage "https://github.com/amitray007/brewfast"
  version "1.0.5"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.5/brewfast-1.0.5-darwin-arm64.tar.gz"
      sha256 "c853fce23f2e74eacb1628d91faec7c8121529e9b94b34ee99d5fc33718d4beb"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.5/brewfast-1.0.5-darwin-x64.tar.gz"
      sha256 "04e130d9254064feb4e54a9cc673fdb1a013d7e50e0bf1538df96e0f8070dbd0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.5/brewfast-1.0.5-linux-arm64.tar.gz"
      sha256 "3bc5af9bdec799b96c28799023b16b0fcfffce7e63e95078ec5032319f0af671"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.5/brewfast-1.0.5-linux-x64.tar.gz"
      sha256 "dd77685d170e5e9283df2820d34ae1655e560cb6db4cfa5d122503f13e487a37"
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
