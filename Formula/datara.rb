class Datara < Formula
  desc "High-performance Post-OOP systems language and Forgen compiler"
  homepage "https://github.com/datara-lang/datara"
  version "1.4.1"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datara-lang/datara/releases/download/v1.4.1/forgen-darwin-arm64.tar.gz"
      sha256 "41b376e0a47dbc1a6979d198da93ae567e445435ec7f90f52aec5134a305556b"
    else
      url "https://github.com/datara-lang/datara/releases/download/v1.4.1/forgen-darwin-x64.tar.gz"
      sha256 "77df876a8b659722ee8117e5baf750feabd0b22ea1eb2c0e015f8e2aa6d59895"
    end
  end

  on_linux do
    url "https://github.com/datara-lang/datara/releases/download/v1.4.1/forgen-linux-x64.tar.gz"
    sha256 "7cb9a64e563f65439e6b89d9b78491e34ec393facd8edbe52d33654f60f038eb"
  end

  def install
    bin.install "forgen"
    bin.install_symlink "forgen" => "datara"
    pkgshare.install Dir["stdlib/*"]
  end

  test do
    (testpath/"test.dtr").write <<~EOS
      fn main() {
        println("Hello from Homebrew Datara!")
      }
    EOS
    assert_match "Hello from Homebrew Datara!", shell_output("#{bin}/forgen run test.dtr")
  end
end
