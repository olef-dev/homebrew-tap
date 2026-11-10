class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.4.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "3f15485c29f300d96f1db32995b9a74254a1cb329642f8d19805ff31624188c2"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.4.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "e2c59ba36cf00f367228563d583e243ec322564059edcdec3d0140e42e67d2af"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.4.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47f62a003fda723f81f825adab3545f2b87599d5ece5d1ed9e0c70f6e951c352"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.4.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3f8660fea187668f5dbdfee52daac6771b3923226ce6955eb76aed4b787f936e"
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
