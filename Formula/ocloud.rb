class Ocloud < Formula
  desc "Olef Cloud CLI — remote workspaces, cloud emulators, remote device leasing, and host daemon"
  homepage "https://olef.dev"
  license :cannot_represent

  depends_on "olef"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/ocloud/releases/download/v3.18.1/ocloud-aarch64-apple-darwin.tar.gz"
      sha256 "cee34ac802ff1bc1d7640a308a33078b4152d81312a593b61049051c1e4ddc29"
    else
      url "https://github.com/olef-dev/ocloud/releases/download/v3.18.1/ocloud-x86_64-apple-darwin.tar.gz"
      sha256 "fca6912bf5262f17202daf1bb54b94bf2d9081116b7f5bfe85fdc1b78cb8addf"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/ocloud/releases/download/v3.18.1/ocloud-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e0396831fccde520f69ff9d0b07b5cbc91ecfb5989123bf22a4a1bbe4ff735f2"
    else
      url "https://github.com/olef-dev/ocloud/releases/download/v3.18.1/ocloud-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4916d10511404cfc76bea7fd96c9bf8de22571d67842a7c23c3e6d6fc467364e"
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
