# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class GcOwners < Formula
  desc "GoCardless code ownership tool"
  homepage "https://github.com/gocardless/gc-owners"
  version "0.1.4"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/codeowners/releases/download/v0.1.4/codeowners_0.1.4_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "b2c158603352877ec581a8c6d87c3e4b5e979fb3e3fd3716ebe98d1157b94eb2"
    end
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/codeowners/releases/download/v0.1.4/codeowners_0.1.4_darwin_arm64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "d75f9232e8c821b45d2846696435f609980ad239c146a1905bc258ee109b875b"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/codeowners/releases/download/v0.1.4/codeowners_0.1.4_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "4647d3704d885b49ff723ecb325529a1246b720d4894aac7a84f82369b81f18b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gocardless/codeowners/releases/download/v0.1.4/codeowners_0.1.4_linux_arm64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "ea5c971698df83d1f1d9187c82a2a438ae0cdb9f895110bb67f3973cbea9d979"
    end
  end

  def install
    bin.install "gc-owners"
  end

  test do
    system "#{bin}/gc-owners version"
  end
end
