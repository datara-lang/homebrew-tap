class Datara < Formula
  desc "High-performance Post-OOP systems language and Forgen compiler"
  homepage "https://github.com/datara-lang/datara"
  version "1.4.1"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datara-lang/datara/releases/download/v1.4.1/forgen-darwin-arm64.tar.gz"
      sha256 "4a2f02935c0fd2f8722ecb3f048598bfecae122c07faf935b73558491c81ee83"
    else
      url "https://github.com/datara-lang/datara/releases/download/v1.4.1/forgen-darwin-x64.tar.gz"
      sha256 "021113163800dc3cdf55c6e2f1c17b12680b4473cac7d03d64dcf3e3c80eebd0"
    end
  end

  on_linux do
    url "https://github.com/datara-lang/datara/releases/download/v1.4.1/forgen-linux-x64.tar.gz"
    sha256 "9694fba29b4aff7f7deda381f0344af8621383e89fbf1011d6dcd3ac2afd614b"
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
