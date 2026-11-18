class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.11.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "26677df0897d10d2b57d3df703f11d262bf8c87fb609c2955409173b3664b0a4"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.11.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "8d1998c4cb5bff29539def3aada1e83e31d2f3105c17f0d090c19e2edb2bc97a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.11.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9ea5e53455eb92173e4e505072e63fba34ea45ade312efda2d6cd5d6f1cefe5d"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.11.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e2f63e5bc6de192f84bce2a990db52220f92326af87d0352d09e5bb2f3f9d72f"
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
