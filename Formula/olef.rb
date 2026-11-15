class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.9.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "94ffdce901e9b18965137bb840dbb37363a27145d25ef0c7b1520438e239b6fd"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.9.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "8fe9e7134cbdc56040ac129cd2bfacbed39471c22d689b3020bb3d0d1c2a3d02"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.9.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "78998345c404cd918c10f107cd777db1c105ce4cb25e6c6b2376825dd6977099"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.9.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9d5891888bfc0e5284bb2521fe0b61ea65c4c9c8f4cd6ee4409e188ba8f6303d"
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
