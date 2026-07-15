# Homebrew formula for loco — the Local Operator. Rendered by the release flow; do not hand-edit.
#
# Placeholders are substituted by .github/workflows/release-please.yml:
#   0.1.2            — bare semver, e.g. 0.2.0 (no leading "v")
#   loco-v0.1.2                — tap release tag, e.g. loco-v0.2.0
#   3a066c4aaea5039663b4e63431060f90286d9ec6d50db797d5b405b4382f448c etc. — per-artifact checksums from goreleaser's checksums.txt
#
# Assets are hosted on the PUBLIC amitray007/homebrew-tap release, not on the
# loco repo's own release: loco is private, so an unauthenticated `brew install`
# cannot fetch from it (verified: those URLs 404 while the tap's return 200).
# If loco ever goes public, the urls below can point at the source repo release
# directly and the tap release becomes redundant.
class Loco < Formula
  desc "Local Operator: a durable local runner (cron + services) and event bus"
  homepage "https://github.com/amitray007/loco"
  version "0.1.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.2/loco_0.1.2_darwin_arm64.tar.gz"
      sha256 "3a066c4aaea5039663b4e63431060f90286d9ec6d50db797d5b405b4382f448c"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.2/loco_0.1.2_darwin_amd64.tar.gz"
      sha256 "6c3f24bec007372dcd58b25246be4f7db48f7b89d21a41b2899e8fda4100c3c6"
    end
  end
  on_linux do
    on_arm do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.2/loco_0.1.2_linux_arm64.tar.gz"
      sha256 "f27765b4db18d3403a0404c0c56f03ba5ea525d2d331c35e32c295e24010fbea"
    end
    on_intel do
      url "https://github.com/amitray007/homebrew-tap/releases/download/loco-v0.1.2/loco_0.1.2_linux_amd64.tar.gz"
      sha256 "99328e8a9ca9efec8472d3cb8c7fc9fb59ca02f3e92ae0cf880a878217a7cc53"
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
