class Ocloud < Formula
  desc "Olef Cloud CLI — remote workspaces, cloud emulators, remote device leasing, and host daemon"
  homepage "https://olef.dev"
  license :cannot_represent

  depends_on "olef"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/ocloud/releases/download/v3.17.2/ocloud-aarch64-apple-darwin.tar.gz"
      sha256 "067742bd3d92d36988033ea9402389a56ec21f85928863ed1a93d14d97e73405"
    else
      url "https://github.com/olef-dev/ocloud/releases/download/v3.17.2/ocloud-x86_64-apple-darwin.tar.gz"
      sha256 "149fe33383abca298f88ba98b66ef92b0695a3cafda6d4079e2c00d379ab478c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/ocloud/releases/download/v3.17.2/ocloud-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cddf7e37ed28c9e482887eb5f252d6b4ebeebdf2c7eaf8b13ece5c027dff4a8c"
    else
      url "https://github.com/olef-dev/ocloud/releases/download/v3.17.2/ocloud-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ac05773904f8467fe351937fc3d1224c1d5e08421fea7fc7c20e37829b04755"
    end
  end

  def install
    bin.install "ocloud"
    prefix.install "LICENSE.md" if File.exist?("LICENSE.md")
    prefix.install "THIRD-PARTY-NOTICES.txt" if File.exist?("THIRD-PARTY-NOTICES.txt")
  end

  test do
    assert_match "ocloud #{version}", shell_output("#{bin}/ocloud --version")
  end
end
