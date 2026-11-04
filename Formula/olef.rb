class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.0.3/olef-aarch64-apple-darwin.tar.gz"
      sha256 "36a1b5d485246f5150895edf7df84bfb8f2de2d041fa702cfb879f8cb77f6f0d"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.0.3/olef-x86_64-apple-darwin.tar.gz"
      sha256 "28c8d36a7fcd9a8f9372c06a7651dc430223732fc6b5011eafedd6204db5e56d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.0.3/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d02d3c094567c81297abf5a30e5da8a022b9a2f08f415e073c6cc63256af6051"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.0.3/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ed1817ea22e8ed7717d7e7ab2e9e28245ea6c33ecf82c82b578b77fec2764745"
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
