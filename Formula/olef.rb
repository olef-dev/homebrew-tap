class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.14.1/olef-aarch64-apple-darwin.tar.gz"
      sha256 "8b83728c7752e705d777c89d497b845e5f3630b617c296bd984f6857246bc1d6"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.14.1/olef-x86_64-apple-darwin.tar.gz"
      sha256 "e41b5b0a7667114ba7d7d7842566818ebeb04b7b3aaa7c054529308c6ecba1a5"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.14.1/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "7875c6cd6ce0ae83dd570faa5513420f164d10ba3638544b42bd20773d67faa4"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.14.1/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5e2212c11f1bf58d1548cbdbe4f6a0df242c0f2094e6ede9f89c07242b4971d3"
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
