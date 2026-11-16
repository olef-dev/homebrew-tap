class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.9.1/olef-aarch64-apple-darwin.tar.gz"
      sha256 "7265036bdfe698184cd7f06f9cb9ceb211320a631c939b167ed3256781bd4397"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.9.1/olef-x86_64-apple-darwin.tar.gz"
      sha256 "a23930a5982acadb6861b75f1b024bf5309f26793175c83af059b56716686d68"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.9.1/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6c91a6a1664b7d666f5a2e3b07585c77a2c7ff8422450b09ddcbc6bafaf5afa4"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.9.1/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7a988838e16cc39951edac91ff714004913cd7f5ed37741989de0020aceb3ec6"
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
