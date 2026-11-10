class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.5.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "f20e33604d4ec159b569b140a7efa64934a7f40ede0c06bc89d7812ec081fecf"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.5.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "72501358cbf53c96d836f213eceaf72ec200f8a2524cdc692e15b9269220d80c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.5.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "037f6a6c1574f625b4f1f0ea27ea859fd1fa6c15aef79037bc36804835ec34b2"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.5.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4914c20cf4c41c200c475f6a159606e04c0931f93778d6752c848e351619fea8"
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
