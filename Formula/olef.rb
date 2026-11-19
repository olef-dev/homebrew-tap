class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.11.2/olef-aarch64-apple-darwin.tar.gz"
      sha256 "a40fd2047b30029030690449c9e2cd2ba2a981c1bfce7e6bd5e6af46d805ddee"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.11.2/olef-x86_64-apple-darwin.tar.gz"
      sha256 "164e5e08947a48c8c4ba8779f8a2cef410a15f093205ddba44ad185a0c35dc7e"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.11.2/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "04187747f5686f170a5475a87e637d830a54d78353e687b4a65c0774d833c95a"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.11.2/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "fe560daf4018d1ba187c0828950af84f82d36dab4486e379d2ba672e301f27d5"
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
