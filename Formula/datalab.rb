# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Datalab < Formula
  desc "GC Datalab - Tool to deploy and manage GC Datalab instances"
  homepage "https://github.com/gocardless/datalab"
  url "https://github.com/gocardless/datalab/releases/download/v0.1.29/datalab_0.1.29_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
  version "0.1.29"
  sha256 "edd3259e79a9c2a3c576875b162049c1ea37680ed9f4f64501bb4679d754d4e6"

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
