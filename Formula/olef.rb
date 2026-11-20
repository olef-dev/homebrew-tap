class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.13.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "1647634125b173dd6ad3d4b5b961ebe7af39900fbbf14508e38415f2451b0e48"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.13.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "58066b8d35ffae21ba60c249d4a61902d2bb45c71eede44cd1c48597e8b058b2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.13.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "47f5d21a4c4f23db5c3dbfaa8247e556c53c0bf468ad6aa956d6198af89440da"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.13.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "665c62e0524f90e79e979097e242f33aca59d1e0afe64563d906781a5dddd519"
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
