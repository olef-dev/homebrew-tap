class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.15.5/olef-aarch64-apple-darwin.tar.gz"
      sha256 "4bb08bc2c00877895df2bb76b9fdc96813c097d5a739ecf075dc201b058aa13f"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.15.5/olef-x86_64-apple-darwin.tar.gz"
      sha256 "f4135debd207ab7505688962eca564107c092457455870b87209cfcec93ae9fc"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.15.5/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0cdf40af86cc576e22e9a00429b1a8f82a659302b7aa2d0e69084a7b721a8fb4"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.15.5/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0d18ef0459fcb2e02b964ac58dfc425e5fa54b6e7e1775fcc27f303e7f89efa1"
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
