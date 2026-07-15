# Homebrew formula for loco — the Local Operator. Rendered by the release flow; do not hand-edit.
#
# Placeholders are substituted by .github/workflows/release-please.yml:
#   0.1.3            — bare semver, e.g. 0.2.0 (no leading "v")
#   loco-v0.1.3                — tap release tag, e.g. loco-v0.2.0
#   2ee3b6c03a18063fb46929db513a48bab73c199d3d854d5544e6b7013daa41c2 etc. — per-artifact checksums from goreleaser's checksums.txt
#
# Assets are hosted on the PUBLIC amitray007/homebrew-tap release, not on the
# loco repo's own release: loco is private, so an unauthenticated `brew install`
# cannot fetch from it (verified: those URLs 404 while the tap's return 200).
# If loco ever goes public, the urls below can point at the source repo release
# directly and the tap release becomes redundant.
class Loco < Formula
  desc "Local Operator: a durable local runner (cron + services) and event bus"
  homepage "https://github.com/amitray007/loco"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.3/loco_0.1.3_darwin_arm64.tar.gz"
      sha256 "2ee3b6c03a18063fb46929db513a48bab73c199d3d854d5544e6b7013daa41c2"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.3/loco_0.1.3_darwin_amd64.tar.gz"
      sha256 "1c237dc9a20cbf000266272c314fd5d08336d34f68b64abf2f53ff9120760410"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.3/loco_0.1.3_linux_arm64.tar.gz"
      sha256 "8655bcbf328ab9019daa4c852a2372e67bf23ddaf4e6a97a3b30d42bd46d34b0"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.3/loco_0.1.3_linux_amd64.tar.gz"
      sha256 "bfb9d15d141fda028492c5a94c0e28d91ce6daf2fa9133f273ea678409958474"
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
