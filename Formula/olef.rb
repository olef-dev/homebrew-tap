class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.15.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "40543c1c989f62dbdffae6799af7bcc4c1dd1b58bccdad38775b9a9af21764cd"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.15.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "28c2061817fd927175b958a1761c5381f48308eeb27629eb417a99b60ce00469"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.15.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9296811ea4f7c5a8f45f19051cf61e55d8497076846fcfce5be9acfd6b60941e"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.15.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "165df4c2a4688577e0f4803aa32f05c829a66f6494ba1a381d0ce39630efe35f"
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
