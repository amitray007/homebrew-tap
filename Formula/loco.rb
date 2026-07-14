# Homebrew formula for loco — the Local Operator. Rendered by the release flow; do not hand-edit.
class Loco < Formula
  desc "Local Operator: a durable local runner (cron + services) and event bus"
  homepage "https://github.com/amitray007/loco"
  version "0.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.0/loco_0.1.0_darwin_arm64.tar.gz"
      sha256 "6aa39ebf2cb6c9030ee160d7ff916d8ad986858acac94971879ed0d48254c2fd"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.0/loco_0.1.0_darwin_amd64.tar.gz"
      sha256 "d301b642df315181e00961b97d97459921d0366ed7acff6c30c12b45809ca4f7"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.0/loco_0.1.0_linux_arm64.tar.gz"
      sha256 "a713668222c22cf31657ccd093a6eee8a0e3b1f3d45cc88dbaa91b9d8d47905f"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.0/loco_0.1.0_linux_amd64.tar.gz"
      sha256 "cb15721c33196988f59ad27a7e67d784c1dc0d978ee1e87c3c2f78417f6ef8d6"
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
