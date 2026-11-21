class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.15.3/olef-aarch64-apple-darwin.tar.gz"
      sha256 "bbf86644c893f5e660057c6373cbe155fe5f4cfa0a9e51d78f5e807a4ba16817"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.15.3/olef-x86_64-apple-darwin.tar.gz"
      sha256 "0e09d1649ad05deddf4f1e852110a8858d069fc1040b47f12d360c0eac241b83"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.15.3/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b2cd11ccf08ac865bd2b3a4b8ce2a3924bb56f51172e93ce9cdf161bdc79eb12"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.15.3/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d7a5fb3e8511ad279aecef0e93f617428e2d1590862ab4be97125fa0e4157737"
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
