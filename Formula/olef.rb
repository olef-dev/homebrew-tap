class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.15.1/olef-aarch64-apple-darwin.tar.gz"
      sha256 "762967da41b53d0144d71398a520d98bf9813e46ae472dc503abd1e0a5f23fc0"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.15.1/olef-x86_64-apple-darwin.tar.gz"
      sha256 "8185007178b127d64592a26428b60a697e0f2e06fcb6b13083ec80b41700d073"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.15.1/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "17e9d78858bd63fcbed0dab35ae353deb32b5845b6867bd44747ec596576acdc"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.15.1/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a9d853d2ac64ea2075872f9d816d5b609a1ab324744366b6e83dc41194b6a90d"
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
