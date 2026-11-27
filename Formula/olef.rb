class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.18.2/olef-aarch64-apple-darwin.tar.gz"
      sha256 "930f343a5513782abb92d3c72cfe4f656b4a695d645a19ab9906a5a2284a9ac1"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.18.2/olef-x86_64-apple-darwin.tar.gz"
      sha256 "f9e8074e6a1f8fa5688658842fd5e719e7c2b676c9a1016e2a02c1e0d8f566ad"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.18.2/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48fa21e23b3da60d0c2c219637999ba469865de8e0104a1053bbf668c8866f09"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.18.2/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d5bda8954107e8fda1686ab7096aa86f36c53a4fddbc8b90b53be8a06646e618"
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
