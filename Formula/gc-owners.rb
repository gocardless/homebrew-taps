# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class GcOwners < Formula
  desc "GoCardless code ownership tool"
  homepage "https://github.com/gocardless/codeowners"
  version "0.4.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/codeowners/releases/download/v0.4.2/codeowners_0.4.2_darwin_arm64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "bb80482b4b238b08f2105745cb1510c01a63a37dbd7e654f99cfbfe8ec219793"

      def install
        bin.install "gc-owners"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/codeowners/releases/download/v0.4.2/codeowners_0.4.2_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "89d4db78cb41d8c745f4ef883dc0a9a180cdb2586c6074c270321b40aa38fb22"

      def install
        bin.install "gc-owners"
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gocardless/codeowners/releases/download/v0.4.2/codeowners_0.4.2_linux_arm64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "068ab46a21856adda2e52f33f6e002eebe237a666d8661656a32d39fe56c0476"

      def install
        bin.install "gc-owners"
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/codeowners/releases/download/v0.4.2/codeowners_0.4.2_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "c8f7b3edb31616c1b7935d9d6d87906b93385b17c4c4c6edd1a6f72d908c4ab1"

      def install
        bin.install "gc-owners"
      end
    end
  end

  test do
    system "#{bin}/gc-owners version"
  end
end
