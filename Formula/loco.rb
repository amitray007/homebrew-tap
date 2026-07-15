# Homebrew formula for loco — the Local Operator. Rendered by the release flow; do not hand-edit.
class Loco < Formula
  desc "Local Operator: a durable local runner (cron + services) and event bus"
  homepage "https://github.com/amitray007/loco"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.1/loco_0.1.1_darwin_arm64.tar.gz"
      sha256 "f600b5f5a6666a934ec7959d0a1316dcb33c416f66592d681b50f0874b86ea4c"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.1/loco_0.1.1_darwin_amd64.tar.gz"
      sha256 "49a8d09000cfce49e53096f84ee4fabf601cea69b6a3621f85e7df0a2149163f"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.1/loco_0.1.1_linux_arm64.tar.gz"
      sha256 "38fba5274bfff4f5e12260b0e5d3cbd9fea5a286101605a44b5298806af7ee26"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.1/loco_0.1.1_linux_amd64.tar.gz"
      sha256 "f394deaa5c9d5f8cddf78262cb9c3e9dc5075aa93067414fcabfe73ff276106b"
    end
  end

  def install
    bin.install "loco"
  end

  def caveats
    <<~EOS
      loco is installed, but the background daemon is NOT started automatically.
      To install and start it (launchd on macOS, systemd user units on Linux):
        loco daemon install
      The daemon needs an active login session. Check health with: loco doctor
    EOS
  end

  test do
    assert_match "loco", shell_output("#{bin}/loco version")
  end
end
