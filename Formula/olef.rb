class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.16.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "c996426e877353fd6a0e8690799d0a84a3b4b9073826e6c25f0e8e22007888de"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.16.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "04761e23cf3c510a57344364a605bf3c6bd6770f4addd48f5050513f9a13a5c8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.16.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "71d94203c9b9b88ac7e5cec3c6eed1b60254a9ce8dea8915dd74782e3485e16c"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.16.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "dec7c768a1b168744aeb96ed68a85c6a3e158ae02d9921efc96153000e3f79ce"
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
