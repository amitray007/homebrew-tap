# Homebrew formula for loco — the Local Operator. Rendered by the release flow; do not hand-edit.
#
# Placeholders are substituted by .github/workflows/release-please.yml:
#   0.1.4            — bare semver, e.g. 0.2.0 (no leading "v")
#   loco-v0.1.4                — tap release tag, e.g. loco-v0.2.0
#   b2e792a61efaf9f4e6508cf825b7a894604c56e09aafa229e73e7be440779518 etc. — per-artifact checksums from goreleaser's checksums.txt
#
# Assets are hosted on the PUBLIC amitray007/homebrew-tap release, not on the
# loco repo's own release: loco is private, so an unauthenticated `brew install`
# cannot fetch from it (verified: those URLs 404 while the tap's return 200).
# If loco ever goes public, the urls below can point at the source repo release
# directly and the tap release becomes redundant.
class Loco < Formula
  desc "Local Operator: a durable local runner (cron + services) and event bus"
  homepage "https://github.com/amitray007/loco"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.4/loco_0.1.4_darwin_arm64.tar.gz"
      sha256 "b2e792a61efaf9f4e6508cf825b7a894604c56e09aafa229e73e7be440779518"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.4/loco_0.1.4_darwin_amd64.tar.gz"
      sha256 "2d775c83bf7c9388a54bc3cee68c324e51060d4b210815e28489374c813165be"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.4/loco_0.1.4_linux_arm64.tar.gz"
      sha256 "8f74e2104c0b8ab09d34c57dee30d8461145aa956eda3b9aa7d6a370e3fdfafd"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.4/loco_0.1.4_linux_amd64.tar.gz"
      sha256 "adf3096740871c7eb773beea0a74d5687c0f9895ace2dc8532eebd269fb3f5a9"
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
