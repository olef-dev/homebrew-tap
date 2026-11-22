class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.16.2/olef-aarch64-apple-darwin.tar.gz"
      sha256 "27c5c6550ddee1b11e564f7897033ea7aed0c64cd6b085b7acbff6ac8b2ca1a6"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.16.2/olef-x86_64-apple-darwin.tar.gz"
      sha256 "9f05c15ad946550891e1e8be4c0487d88a4440e130313cdc57806b1ecf0ed910"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.16.2/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6ed79cac74bfeb5f78436f658b9455d16fa8f01de4964f004dfead2fa38b4a45"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.16.2/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42df6af1bc57693f18024ff4fced4c80aaea942d45f674035eaf363ef54c54f6"
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
