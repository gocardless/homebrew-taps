# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class GcOwners < Formula
  desc "GoCardless code ownership tool"
  homepage "https://github.com/gocardless/gc-owners"
  version "0.4.9"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/codeowners/releases/download/v0.4.9/codeowners_0.4.9_darwin_amd64.tar.gz", using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "6ce62d17b78a90ef74be815fd327e32fbd5f0ea393d330f888c6cbaecf6d86e3"

      def install
        bin.install "gc-owners"
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/codeowners/releases/download/v0.4.9/codeowners_0.4.9_darwin_arm64.tar.gz", using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "e2c4d1b04cfb9b7f474785d797aa58d91fdc597f6b61a6cf60410e6aea1dd59b"

      def install
        bin.install "gc-owners"
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/gocardless/codeowners/releases/download/v0.4.9/codeowners_0.4.9_linux_amd64.tar.gz", using: Gc::GithubPrivateReleaseDownloadStrategy
        sha256 "a7498e6c4abfe9e21c5f197f19f4e30688551797185fb391a372516694b7ba36"

        def install
          bin.install "gc-owners"
        end
      end
    end
    if Hardware::CPU.arm?
      if Hardware::CPU.is_64_bit?
        url "https://github.com/gocardless/codeowners/releases/download/v0.4.9/codeowners_0.4.9_linux_arm64.tar.gz", using: Gc::GithubPrivateReleaseDownloadStrategy
        sha256 "c93c3d3c172645e3f49368870677ac8e0d7ec4c30a1f3e8359997654267ce83c"

        def install
          bin.install "gc-owners"
        end
      end
    end
  end

  test do
    system "#{bin}/gc-owners version"
  end
end
