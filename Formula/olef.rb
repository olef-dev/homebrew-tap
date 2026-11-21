class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.15.2/olef-aarch64-apple-darwin.tar.gz"
      sha256 "492be3baea227da94fae7b47bd6773c768061a0ee02fca9fc7b93448afad6edb"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.15.2/olef-x86_64-apple-darwin.tar.gz"
      sha256 "501d554c850d0dc9d313eec9ea9b49963d110b574dca9c47f938415fb7f634f0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.15.2/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc712ba326688a3bf2d66c3798d9f06c3314b261497cda29ff2f55d85e3d28b1"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.15.2/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b762a0ea5cc815e3a8375c783a68a49bb1ac0736161acce1909ad4e924ee7422"
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
