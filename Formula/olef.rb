class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.14.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "a1ab3164e0d021992d98f19f374774c559a14d269b41c496e66410e9e8c62886"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.14.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "40d5300cabd299c4c4471f64958fd5e59bdcf60235af59ee34db29ed5c465f93"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.14.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d7876d5cf4799d17a6b9e5d13a4ea69b970cb8dc4be0342210f2100990dfe03b"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.14.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "331766c8974d0000f598ec5d8d61aef507c45b681753f50d83017c52dbeed7c1"
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
