class Datara < Formula
  desc "High-performance Post-OOP systems language and Forgen compiler"
  homepage "https://github.com/datara-lang/datara"
  version "1.3.0"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datara-lang/datara/releases/download/v1.3.0/forgen-darwin-arm64.tar.gz"
      sha256 "7d112d830514ce24d4aa8f5f94293226600239c0b3cc926ded32e245ca08580b"
    else
      url "https://github.com/datara-lang/datara/releases/download/v1.3.0/forgen-darwin-x64.tar.gz"
      sha256 "18856a408ab3e09116bb2da1875538787b2b87bf454e165ed382e7c9f03462fc"
    end
  end

  on_linux do
    url "https://github.com/datara-lang/datara/releases/download/v1.3.0/forgen-linux-x64.tar.gz"
    sha256 "bad05176068f54d51756adecd7dbd3bef2bbe9faa73c44dfd0b2d51b77b329d7"
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
