class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.1.0/olef-aarch64-apple-darwin.tar.gz"
      sha256 "417e0a02860dc243d221f1d79f4bff80b52a3fd246f98f23f05fd963ed3cede2"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.1.0/olef-x86_64-apple-darwin.tar.gz"
      sha256 "df91b7a7c2203fa14b039a1ce278db314187553b6a9e77802462696fd5fe347d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.1.0/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4efc734613e7f3b665dddccaf5d27f670ed597b0c3a56922576d5474609c01f"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.1.0/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "74ba2727afd802a4f3d7fa161de2547db3576bbd0354eb6d1aca33cb4e2f8bed"
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
