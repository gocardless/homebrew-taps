# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Dispatcher < Formula
  desc "Continuously dispatching deploys"
  homepage "https://github.com/gocardless/dispatcher"
  version "0.19.3"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/dispatcher/releases/download/v0.19.3/dispatcher_0.19.3_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "a24d9a3bd3216308db3b4520fdfb9d8e1f3f6ae9dfd453dbbb133794fe0ea2f7"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/dispatcher/releases/download/v0.19.3/dispatcher_0.19.3_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "2e67926d83c8fe5ac83ae796e26b76f6ade43e7e954b0f6b86019229ec198675"
    end
  end

  def install
    bin.install "dispatcher"
  end

  test do
    system "#{bin}/dispatcher version"
  end
end
