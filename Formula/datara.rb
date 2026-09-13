class Datara < Formula
  desc "High-performance Post-OOP systems language and Forgen compiler"
  homepage "https://github.com/datara-lang/datara"
  version "1.2.7"
  license any_of: ["Apache-2.0", "MIT"]

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/datara-lang/datara/releases/download/v1.2.7/forgen-darwin-arm64.tar.gz"
      sha256 "e240a89b9859e7357eb1d72903af1bf3327b36900e98b9069e58df9cd75abb5c"
    else
      url "https://github.com/datara-lang/datara/releases/download/v1.2.7/forgen-darwin-x64.tar.gz"
      sha256 "8043df03adfb519fbc17cd16b50e316e7887ec90b7c2bd26065be061af73301c"
    end
  end

  on_linux do
    url "https://github.com/datara-lang/datara/releases/download/v1.2.7/forgen-linux-x64.tar.gz"
    sha256 "0c9d06d868a5c578d6358d813dc2fc098f5faaa8e8e66019e71ce9e8edcea47f"
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
