class Ocloud < Formula
  desc "Olef Cloud CLI — remote workspaces, cloud emulators, remote device leasing, and host daemon"
  homepage "https://olef.dev"
  license :cannot_represent

  depends_on "olef"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.17.0/ocloud-aarch64-apple-darwin.tar.gz"
      sha256 "ae7b085f4bf8c049133b27ef954d3b0ebb9d5b34764d82fe6aed7a48fce15b53"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.17.0/ocloud-x86_64-apple-darwin.tar.gz"
      sha256 "518ac5a3bb0e550b7a9843c7edcc5497c57f7e57a8427c7df11176ba8acedfda"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/olef-dev/olef/releases/download/v3.17.0/ocloud-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "dc6806a8f8fdcd5c982e8f460b0f1087bd973164b23aff36635a017e8038ffe6"
    else
      url "https://github.com/olef-dev/olef/releases/download/v3.17.0/ocloud-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f69a50abf759325d41c898fc3209442209255557ce460ff0fc804827b4847563"
    end
  end

  def install
    bin.install "ocloud"
    prefix.install "LICENSE.md" if File.exist?("LICENSE.md")
    prefix.install "THIRD-PARTY-NOTICES.txt" if File.exist?("THIRD-PARTY-NOTICES.txt")
  end

  test do
    assert_match "ocloud #{version}", shell_output("#{bin}/ocloud --version")
  end
end
