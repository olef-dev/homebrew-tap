class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.3.1/olef-aarch64-apple-darwin.tar.gz"
      sha256 "faade73118ff3ea67d772834c1ad2042f612f6b38e4b6a6f06c8cf57ed953038"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.3.1/olef-x86_64-apple-darwin.tar.gz"
      sha256 "c9827e042908095a833a3b79f4f78451853ecfddeff11be806d7da92625e3c78"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.3.1/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "70d07c1d12aec83fde945ceab0e78590552064d4fae5174f5e04b93be5b41cde"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.3.1/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4ba664bf464b32128b328140e39da43d068dc6758c324d74458429e1153d6730"
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
