class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.8.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "6be993f9546cb3426ff8fd92bf5837275863e059f0ad05e51ce2d597e6352894"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.8.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "00f56c8082775e1c116d4a624f101433909f42e8002d1922d72a0bc640b1285c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.8.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3fd37bded65d8bc8836e094fbf3f502fda546005a5afe7f6b348a45ea0257b8c"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.8.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9822bd6ec541d87d729cb6cf7ff0ae1e270b88198649ef90d39f9d15fee58ec7"
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
