class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.12.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "b9b09b071c1967933c522d2909c7e5b798a6b151e4652dba718117bfd58eabe1"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.12.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "9fefff1106ffb311e74ee9d3222485acce28f3edff5792640f086343a427f7f6"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.12.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "831832e151a9f8308299d58d2dcf706c4913f68e1b8989b26afe2a8c10edbae4"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.12.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c22799579b577049363c4a1ec95e143d0f8a92097f0cd6486bea4b2fe50559dd"
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
