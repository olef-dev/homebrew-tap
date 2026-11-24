class Ocloud < Formula
  desc "Olef Cloud CLI — remote workspaces, cloud emulators, remote device leasing, and host daemon"
  homepage "https://olef.dev"
  license :cannot_represent

  depends_on "olef"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/ocloud/releases/download/v3.17.3/ocloud-aarch64-apple-darwin.tar.gz"
      sha256 "cb9230019595ee6ea3a89af63d18a9fb6a2a871c6da2d90623e6ffcd5079f3e4"
    else
      url "https://github.com/olef-dev/ocloud/releases/download/v3.17.3/ocloud-x86_64-apple-darwin.tar.gz"
      sha256 "8f84d99dde9d068baadfcb3e3bbbb65b688e5f2da85a9aaba286c63f5fee413b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/ocloud/releases/download/v3.17.3/ocloud-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ee09ddc4b678f49016c407afac01b4847569063c8faabcbcdab6d503e9c834e0"
    else
      url "https://github.com/olef-dev/ocloud/releases/download/v3.17.3/ocloud-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6eb58ad978a91ef78d403aa38d553eb680968b919d6a9901bf87c8206cee83aa"
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
