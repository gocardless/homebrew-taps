# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Dispatcher < Formula
  desc "Continuously dispatching deploys"
  homepage "https://github.com/gocardless/dispatcher"
  version "0.10.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/dispatcher/releases/download/v0.10.0/dispatcher_0.10.0_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "53d74c52259301a780731abf157a78efcd9f0356027a5cccf07e9e15dc86528f"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/dispatcher/releases/download/v0.10.0/dispatcher_0.10.0_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "3deaab67341d4cd3da5c20b4a44765dc76a71d508802a19d7eb69f656d4d8cf4"
    end
  end

  def install
    bin.install "dispatcher"
  end

  test do
    system "#{bin}/dispatcher version"
  end
end
