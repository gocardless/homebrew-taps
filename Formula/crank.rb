require_relative "../lib/gc/github_private_release_download_strategy"

class Crank < Formula
  desc "GoCardless JSONSchema template generator"
  homepage "https://github.com/gocardless/crank"
  version "3"

  if OS.mac?
    url "https://github.com/gocardless/crank/releases/download/v26e1536/crank_darwin_amd64", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "57070386320142d7548d225156a1e6a06e1abd9fc33f871b92737a33696ef161"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/crank/releases/download/v26e1536/crank_linux_amd64", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "98fe8dfadf9d9d1cec89db6a8a907b99846f6dff198e8bf725d528b32d7ce244"
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
