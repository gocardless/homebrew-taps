# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class GcOwners < Formula
  desc "GoCardless code ownership tool"
  homepage "https://github.com/gocardless/gc-owners"
  url "https://github.com/gocardless/codeowners/releases/download/v0.0.8/codeowners_0.0.8_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
  version "0.0.8"
  sha256 "70c2aab3f023887a1d9523e047214a2978f10c3cd9db59c62e7238e26aa6be4a"

  def install
    bin.install "gc-owners"
  end

  test do
    system "#{bin}/gc-owners version"
  end
end
