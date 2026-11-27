class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.18.3/olef-aarch64-apple-darwin.tar.gz"
      sha256 "ac13fb77740603ad06506c0f256a8f4b0bba4e518d77cc0305bcab05fd6224e8"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.18.3/olef-x86_64-apple-darwin.tar.gz"
      sha256 "6a5a329831a67b8203da48f5ca3b13485f52385e0b12748f333eeb0d2dae3ebe"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.18.3/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0864f6d98e1d81dcd950073ce76a3b80ea904f228c4be214463e7fde0ae710bd"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.18.3/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f6a4555a682ae8f444b028468a0ad30a64cbd0e1029624d922da14e8792bcd61"
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
