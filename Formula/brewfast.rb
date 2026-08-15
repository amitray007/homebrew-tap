# typed: strict
# frozen_string_literal: true

# Rendered by the release workflow; do not hand-edit.
class Brewfast < Formula
  desc "Accelerate Homebrew cask installs from throttled GitHub release assets"
  homepage "https://github.com/amitray007/brewfast"
  version "1.0.6"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.6/brewfast-1.0.6-darwin-arm64.tar.gz"
      sha256 "2a7fcb4074a6bf38b262216d79ac326fc2dbb819197e526967fece87f585b141"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.6/brewfast-1.0.6-darwin-x64.tar.gz"
      sha256 "b283d4c6711595ca901574968fc3abbc264af20abf7435936ebe3cae2afc399b"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.6/brewfast-1.0.6-linux-arm64.tar.gz"
      sha256 "7e58bbd757cd2693ef4f56d3d3b207bb8a070d26637ee9937f563bfd8ec195d3"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/brewfast-v1.0.6/brewfast-1.0.6-linux-x64.tar.gz"
      sha256 "eea0268a6293868d0cbbe6ea2863d8ffbb8e6767b304ab1e1a47b6ea365205d9"
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
