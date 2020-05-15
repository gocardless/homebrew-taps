# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Dispatcher < Formula
  desc "Continuously dispatching deploys"
  homepage "https://github.com/gocardless/dispatcher"
  version "0.4.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/dispatcher/releases/download/v0.4.0/dispatcher_0.4.0_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "c61a84856eecbcd1891eb034b26677fddac17796be0691b396c00021c5abf2db"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/dispatcher/releases/download/v0.4.0/dispatcher_0.4.0_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "fe0e5d7329a1e1b83ec16d57ac05e2ab644fa53a7b074da11d558bcebcfdee02"
    end
  end

  def install
    bin.install "dispatcher"
  end

  test do
    system "#{bin}/dispatcher version"
  end
end
