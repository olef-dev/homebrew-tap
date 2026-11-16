class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.9.2/olef-aarch64-apple-darwin.tar.gz"
      sha256 "b48d70d363b94f409a4c3af41218aa3b486225da71690c8af866886032578a6b"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.9.2/olef-x86_64-apple-darwin.tar.gz"
      sha256 "b80d67fb49461840e6864d017adeab2809cc3ed8c5d5cb52634965e0ca6dff69"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.9.2/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e29998a3a16b7540454475b69c469472adf88142da57df269796aa1575ab1bd0"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.9.2/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6b11defcf7a08ee547ac38c449f86d97fb9a7c9bbc6e3a75958be27e04fbbe13"
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
