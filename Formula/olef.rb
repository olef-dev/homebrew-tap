class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.3.2/olef-aarch64-apple-darwin.tar.gz"
      sha256 "5337bfed884432386dd506f77e6cdbdcc07a56873f00ee98538d86f49a0fbc1b"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.3.2/olef-x86_64-apple-darwin.tar.gz"
      sha256 "1db071fc729963ee01773de697d1e28a05a9d6f180b8f5e30b7da4909bd9b248"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.3.2/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "2dac2412b3ab259a6e82aeacfd51b3924a2c1134a8e20088b8ea31e2b7d72f77"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.3.2/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e9439f75bf91aab6f694ce3b353a98f3ffb267ebc81ecc984820cbb2e54fbb3"
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
