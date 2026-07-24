# typed: strict
# frozen_string_literal: true

# Homebrew formula for ccstack. Rendered by the release workflow; do not hand-edit.
class Ccstack < Formula
  desc "Manage Claude Code configuration across global and project scopes"
  homepage "https://github.com/amitray007/ccstack"
  version "0.2.0"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/ccstack-v0.2.0/ccstack-0.2.0-darwin-arm64.tar.gz"
      sha256 "6e54578c932102d9db2989ea06761d64b043a26e6add629e9f0a4e65da06759e"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/ccstack-v0.2.0/ccstack-0.2.0-darwin-x64.tar.gz"
      sha256 "b9f0b2d5704b78039dbcfb01e3e28c4e338e16c3bbb77c279c8b8a63fcb8e5f7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/ccstack-v0.2.0/ccstack-0.2.0-linux-arm64.tar.gz"
      sha256 "e9c3dd0eab620911a57f91a48f24e5208b1eb59835aa37a20047308faeff4654"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/ccstack-v0.2.0/ccstack-0.2.0-linux-x64.tar.gz"
      sha256 "d046c77c3c648bad1129dc90a886648beee0c51a87c3d76214f265856d91f482"
    end
  end

  def install
    bin.install "ccstack"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/ccstack --version").strip
    assert_match "ccstack", shell_output("#{bin}/ccstack --help")
  end
end
