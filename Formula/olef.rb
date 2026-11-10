class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.7.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "0de6c21b257ee1fa5cbb3374d7810f99a5405277d0bad6e19f97022e2bf1a614"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.7.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "33a32fdc249177f7b212fd0644c5e8d45aa4a9001036e53bae09af8c799e2b33"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.7.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "545ec396940034f5ac7552769b4f3aef06262df987b6f02a0c0c3c01de6af131"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.7.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7e0ed8a149f4dd6673149f78d76f5dfe5c27de54424c78b0a9438201239c2dd9"
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
