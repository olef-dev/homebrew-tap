class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.16.5/olef-aarch64-apple-darwin.tar.gz"
      sha256 "43b5f3a5b2874e8c4928ff34156866c6c5c7dd6f942e31273fcd255ec4e46384"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.16.5/olef-x86_64-apple-darwin.tar.gz"
      sha256 "0d096b47cb88c5ef3e7fbc964a19197f283d2e55e4777c598b69b8e4d454ff97"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.16.5/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "917b3ff9c0cb7b6fe2b3f83a9ea069eae852773b41473656fa0bb54a839e3b5b"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.16.5/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6cc48f2069bf9fc90190901f05f8e820381f1917ae19230c12ded7c8e827c18d"
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
