class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.18.1/olef-aarch64-apple-darwin.tar.gz"
      sha256 "634da33ab310a512ccc8fdd349d0798b59e83db83d01f3b8fc078c65c1058283"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.18.1/olef-x86_64-apple-darwin.tar.gz"
      sha256 "b1a5f0bfe4a0626284de4bbb54e60a7f6a9e1aa1dbdd800924e303c6096696f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.18.1/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c383d7ac7d9eba88acb26bb5cffcd597ecbdab6231a34dadf5e160519ea7d9d8"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.18.1/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "91b3dff65a005e89d2cebb31241e68761bf6569eab6d79a5608d69bf2ac94de2"
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
