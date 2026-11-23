class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.17.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "4b2dd44edd1b371b5383ab8ea50be8017aae3b219f420201c8461d8b51340487"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.17.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "0f67c8c45b74cefe2f5fa2fc2e2f4bde12316ad75623a36fe01f86d4e258335c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.17.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5d1bb157767489f49b4f3c819efa1d1b76a7e816fcf58ed74d8fbddc690401d9"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.17.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ecb2f0b086bf52f645b04928299c169a800c3fb2cc1d628041c589344a08077"
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
