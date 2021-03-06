# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Datalab < Formula
  desc "GC Datalab - Tool to deploy and manage GC Datalab instances"
  homepage "https://github.com/gocardless/datalab"
  url "https://github.com/gocardless/datalab/releases/download/v0.1.28/datalab_0.1.28_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
  version "0.1.28"
  sha256 "38333477b4165a5bd9c100881586b0c01c6c75ef9eb879a763e9143506272b0c"

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
