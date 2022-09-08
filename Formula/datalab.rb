# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Datalab < Formula
  desc "GC Datalab - Tool to deploy and manage GC Datalab instances"
  homepage "https://github.com/gocardless/datalab"
  url "https://github.com/gocardless/datalab/releases/download/v0.1.39/datalab_0.1.39_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
  version "0.1.39"
  sha256 "2ab2ad6e703fc520fd9c16e9cc1107debbb3a115813b41dc7d8576080593ceb5"

  def install
    bin.install "datalab"
    scripts = prefix/"scripts"
    scripts.mkdir
    scripts.install Dir["scripts/*"]
  end

  test do
    system "#{bin}/datalab --version"
  end
end
