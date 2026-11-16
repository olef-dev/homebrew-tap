class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.10.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "7416c9acaa3aafddc4f88477e7de5cc156bea8e73f2c0b3e8f1155cc5ddb468c"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.10.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "c28c395188268a8ab381e9644cab6371019e132673a3cfe58be63dd0bb486b86"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.10.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cd3558afbd2e343672a82f3a10d740ea558fc7e648214ad7406173a45b6f0ad0"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.10.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "06e3eee2ce5e362adb1f994c64d7671e3cd875db57d061ca5690fe00721c184c"
    end
  end

  def install
    bin.install "olef"
    # The pre-rename command; v2 scripts keep working.
    bin.install_symlink "olef" => "shadowdroid"
    prefix.install "LICENSE.md" if File.exist?("LICENSE.md")
    prefix.install "THIRD-PARTY-NOTICES.txt" if File.exist?("THIRD-PARTY-NOTICES.txt")
  end

  test do
    assert_match "olef #{version}", shell_output("#{bin}/olef --version")
  end
end
