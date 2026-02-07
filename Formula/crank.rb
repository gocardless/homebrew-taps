require_relative "../lib/gc/github_private_release_download_strategy"

class Crank < Formula
  desc "GoCardless JSONSchema template generator"
  homepage "https://github.com/gocardless/crank"
  version "5"

  if OS.mac?
    url "https://github.com/gocardless/crank/releases/download/v1.2.0/crank_darwin_amd64", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "968ec943f71b14f714d65bbc36d3c22697cdc5870c8a84145756854fb83346a0"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/crank/releases/download/v1.2.0/crank_linux_amd64", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "66dc402539b0b701f8f460df24521a4e38a9c823cbbc57b9df0e6ec9fd975625"
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
    output = shell_output("#{bin}/crank 2>&1", 2)
    assert_match "Usage:", output
  end
end
