class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.16.4/olef-aarch64-apple-darwin.tar.gz"
      sha256 "9540d920b53d650be87e1b2461be46abddad12f7fb58b12e1a504636c8902392"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.16.4/olef-x86_64-apple-darwin.tar.gz"
      sha256 "f96fafc049cc0bb5eacb2aacfdb64ce760ccf284b1f1482e1e076ea8a42ba25a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.16.4/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ccd3babfda9940e95eea7d6ecbaeff1b8f2c0a3a24c6b680d5cd4aaa779fe72b"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.16.4/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6ee583156c7dd31e044537eb9bbd288ca944efe81b889df685221ea335fb8b4c"
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
