class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.0.2/olef-aarch64-apple-darwin.tar.gz"
      sha256 "22574aeb045c76dfaf60c187c0ee5d1ff4843c886cd596ccfe2b985345a09d5d"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.0.2/olef-x86_64-apple-darwin.tar.gz"
      sha256 "768bbf07c04dfabc4e0b1ec5d7919acdba650531e20f3e0ea29eb6d2ec8ce52a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.0.2/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "76027af35183b949c768563f4b9c4bd9f473cadb0c3d400f6a3b35e7ed4f63db"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.0.2/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8492e1bd14e1bdc30918b115f92fdcd80ffa7fece587fae49873dba9770c1a25"
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
