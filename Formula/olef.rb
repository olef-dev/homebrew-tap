class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.3.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "caac82db94bf8aca19176b5e87d5baeb3f7219955e3d7bab48cdf7091f221180"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.3.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "470210a60cb34892336b6c35fd4ae2b91618eef46d58609101358896b6d49305"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.3.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f5bebc9a15669106db33ecd18e1177da15888778dff394a253ed04120db5df28"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.3.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ff1fb643ca4e5f6a9c172de2c00abc0bf13b44a0c43ba85fd75aec506cd044f3"
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
