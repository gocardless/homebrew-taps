# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Datalab < Formula
  desc "GC Datalab - Tool to deploy and manage GC Datalab instances"
  homepage "https://github.com/gocardless/datalab"
  url "https://github.com/gocardless/datalab/releases/download/v0.1.9/datalab_0.1.9_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
  version "0.1.9"
  sha256 "57353f0acde77182cdae51d907594d809a0347c292336d6f2c1cb7aa8ade12d4"

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
