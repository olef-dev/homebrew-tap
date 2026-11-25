class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.18.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "660f4db8866f22b2e892c0900316b2915f09dc6fb21f974ab9d6289166c8e6d2"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.18.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "685166a3a48b8ec83fe9aa3b32d544cdaf2eac8187796a9f4870fa6221bd531e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.18.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "efedd7942f2b7e2a1da78919f247b02fdc6a80cdf3b1e615c45175d09f8a0f1b"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.18.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0a4195dc55714015b677759afa06ec13fc36c877edb13f60af293dcc78092223"
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
