class Ocloud < Formula
  desc "Olef Cloud CLI — remote workspaces, cloud emulators, remote device leasing, and host daemon"
  homepage "https://olef.dev"
  license :cannot_represent

  depends_on "olef"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/ocloud/releases/download/v3.17.1/ocloud-aarch64-apple-darwin.tar.gz"
      sha256 "809f3014b55349dd0fa550d02d190b1e45239ad9c0b1d4afeaf81e474a70855b"
    else
      url "https://github.com/olef-dev/ocloud/releases/download/v3.17.1/ocloud-x86_64-apple-darwin.tar.gz"
      sha256 "29348c631309afdc26fc124d92b5611fc75bb65791cc344962e2dd7c3542d9ff"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/ocloud/releases/download/v3.17.1/ocloud-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cc305cab2f49a61add343bb540c15d22463007102e0c9cd1d9f10bd0ce1366d7"
    else
      url "https://github.com/olef-dev/ocloud/releases/download/v3.17.1/ocloud-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8866cfe7ed1f92792ed3727b8fccfd041b4d910ae88dc619428958ebd0fe0102"
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
