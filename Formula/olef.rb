class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.2.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "f509b8d87fe74776fc3bc228bcfcd4e50497c48b515b070f0044506cdc997a11"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.2.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "83d542737bc0dfe2761c36832072aa09873a1f04e2d7ce7a7dcdfac5463e104b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.2.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da2ac847f3dbf92b7c3fb7e85c163de17250e41b60f27c4101a69136017639c5"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.2.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "640ef93eaec9a28e46806c3208518ca6f63d9641050f31db7543621b82942ee5"
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
