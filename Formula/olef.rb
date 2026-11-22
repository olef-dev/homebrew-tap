class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.16.1/olef-aarch64-apple-darwin.tar.gz"
      sha256 "de64da41de2e3f8aac4928c01afa4c2dfc52e19110cc03a4eca049d90299e5a9"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.16.1/olef-x86_64-apple-darwin.tar.gz"
      sha256 "c131eb5379e3c9927ea2da01e63baaca435d421949b816065a2337226f781a03"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.16.1/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "746298f3ef11730278d8d5e9be291c9d3f8e70b3b372e240dcc016825c810dad"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.16.1/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1038b67dd857c1f759cb6e8106f0dd8e65bb3c6dd17b5c4d575ab34cd543f5db"
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
