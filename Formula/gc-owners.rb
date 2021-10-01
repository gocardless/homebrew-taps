# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class GcOwners < Formula
  desc "GoCardless code ownership tool"
  homepage "https://github.com/gocardless/gc-owners"
  version "0.2.0"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/codeowners/releases/download/v0.2.0/codeowners_0.2.0_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "2c7348ef248adb84a520720bbdda435c906704f49e23b7c038b22b427b02814a"
    end
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/codeowners/releases/download/v0.2.0/codeowners_0.2.0_darwin_arm64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "ffe596db625434835227d4f52fd796c6254bdc2cd1a73bc530a22d365fa20cdb"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/codeowners/releases/download/v0.2.0/codeowners_0.2.0_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "1d5b69dc4c7e84bb30e74d50727fb01ef43112ebabfff8e25b1b75ed7d52687b"
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gocardless/codeowners/releases/download/v0.2.0/codeowners_0.2.0_linux_arm64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "6b55edfe2da3117548db1509dfb0ce1af943dd6738b33247166f777a217255b5"
    end
  end

  def install
    bin.install "gc-owners"
  end

  test do
    system "#{bin}/gc-owners version"
  end
end
