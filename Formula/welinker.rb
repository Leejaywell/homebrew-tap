class Welinker < Formula
  desc "WeChat iLink to AI Agent bridge"
  homepage "https://github.com/Leejaywell/welinker"
  url "https://github.com/Leejaywell/welinker/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "93939efeccf75aa97e80f7fc6b23dedc10b8a6aed5e1437a70bb9ccf2862c6a0"
  license "MIT"

  head "https://github.com/Leejaywell/welinker.git", branch: "main"

  depends_on "rust" => :build
  depends_on "node"

  def install
    system "npm", "ci", "--prefix", "web"
    system "cargo", "install", *std_cargo_args(path: ".")
  end

  test do
    assert_match "welinker", shell_output("#{bin}/welinker version")
  end
end
