# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Dispatcher < Formula
  desc "Continuously dispatching deploys"
  homepage "https://github.com/gocardless/dispatcher"
  version "0.17.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/dispatcher/releases/download/v0.17.1/dispatcher_0.17.1_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "350cdb4a1beef5c239de182064d2a668aad2fa53258ecda835fb7b20f27e5ddb"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/dispatcher/releases/download/v0.17.1/dispatcher_0.17.1_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "e33abc033145bd6e33d2f790ee9507970111a6cc5932c501449573c39e7de3c6"
    end
  end

  def install
    bin.install "dispatcher"
  end

  test do
    system "#{bin}/dispatcher version"
  end
end
