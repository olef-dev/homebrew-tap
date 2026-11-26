class Ocloud < Formula
  desc "Olef Cloud CLI — remote workspaces, cloud emulators, remote device leasing, and host daemon"
  homepage "https://olef.dev"
  license :cannot_represent

  depends_on "olef"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/ocloud/releases/download/v3.18.0/ocloud-aarch64-apple-darwin.tar.gz"
      sha256 "b1c2f29b205ded045f72fc86d88524c1e4b0c01991fe651574cd97e6efb4e589"
    else
      url "https://github.com/olef-dev/ocloud/releases/download/v3.18.0/ocloud-x86_64-apple-darwin.tar.gz"
      sha256 "2ffbc70fc3e009bb73fcc47b09629e2bf21facaafe46bfdc5ce96a87d88ae099"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/ocloud/releases/download/v3.18.0/ocloud-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a6a62d0b379d7f99a165377ed3b5bb5f6167a2a5c81672e3b20ed78238f1f53b"
    else
      url "https://github.com/olef-dev/ocloud/releases/download/v3.18.0/ocloud-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4f1a6b6a0610c2c80fad0a3eedaf34ed24e6673067722120b1592f1e69aae327"
    end
  end

  def install
    bin.install "ocloud"
    prefix.install "LICENSE.md" if File.exist?("LICENSE.md")
    prefix.install "THIRD-PARTY-NOTICES.txt" if File.exist?("THIRD-PARTY-NOTICES.txt")
  end

  test do
    assert_match "ocloud #{version}", shell_output("#{bin}/ocloud --version")
  end
end
