# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Datalab < Formula
  desc "GC Datalab - Tool to deploy and manage GC Datalab instances"
  homepage "https://github.com/gocardless/datalab"
  url "https://github.com/gocardless/datalab/releases/download/v0.1.51/datalab_0.1.51_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
  version "0.1.51"
  sha256 "9540815e30f88021ac884f56e30e40c7bc846a9cf4e4a718b73e8bc017e4508e"

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
