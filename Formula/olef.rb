class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.6.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "428a18e30f02af2441034e0b88412d75fc48f39fba84c2146b88e215563789b9"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.6.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "27440aa8ba188bf3bab51a7785eeeff2966bcb4567a443e48647e8370ca37597"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.6.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf1e2d54893a7379e2619f58b3bfacce86e2c5fc82a18f01b3a63784a189dddb"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.6.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3fe479a590450a178c0b2a420f068cc7d347de1111989b0dcb16eca0a5dc1d0"
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
