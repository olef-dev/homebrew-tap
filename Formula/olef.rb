class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.11.1/olef-aarch64-apple-darwin.tar.gz"
      sha256 "fadcc490c36dacb828873dc58571f590f455a4ae6e13c3fd0ffa9f459eb2f126"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.11.1/olef-x86_64-apple-darwin.tar.gz"
      sha256 "146891775c6373935b65c1059b0b63ea6eaa3d7bfc06a02f59dec9460bbbd667"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.11.1/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "57f1ccc9e86d42bce72ddf9cfdedbfd7d2f5e9ee08dcb6a904b60a082d643231"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.11.1/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b5b89f4c22005b375c6a91fc31cedfa151ae5fa51e6fe56cb14e575f844fe2d"
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
