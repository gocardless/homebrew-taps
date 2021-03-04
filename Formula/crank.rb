require_relative "../lib/gc/github_private_release_download_strategy"

class Crank < Formula
  desc "GoCardless JSONSchema template generator"
  homepage "https://github.com/gocardless/crank"
  version "1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/crank/releases/download/va9b9cfe/crank_darwin_amd64", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "4fad436b7222e725a73ffe14b47de55f1c2ec2fa722f687ba28169de4842be7e"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/crank/releases/download/va9b9cfe/crank_linux_amd64", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "1afda23606db0bfbfe3ec9ce38bd69fa399ee3c2ee4f5134d53b1f38f900490c"
    end
  end

  def install
    if OS.mac?
      bin.install "crank_darwin_amd64" => "crank"
    elsif OS.linux?
      bin.install "crank_linux_amd64" => "crank"
    end
  end

  test do
    assert_equal(shell_output("#{bin}/crank").first(17), "crank Git version")
  end
end
