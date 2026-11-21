class Olef < Formula
  desc "Drive Android apps from the command-line with streaming JSON events"
  homepage "https://olef.dev"
  license :cannot_represent

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.15.4/olef-aarch64-apple-darwin.tar.gz"
      sha256 "702378fe547fac195cf50a667ea3a7f15b60d685e09f270bf629819c9254da7b"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.15.4/olef-x86_64-apple-darwin.tar.gz"
      sha256 "28df7f91994f1f14dc008ca9cc3243acc738a6aacbc630927db2f6a343426aea"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.15.4/olef-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d0885d1c80fc979931a9c93292e1e0a4e60f35a9b88309c0311219ffbbef9526"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.15.4/olef-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "913929a08e5cdf9ea8fc6265dc254663732d8e6ed89da8716804efd6164c909f"
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
