require_relative "../lib/gc/github_private_release_download_strategy"

class Crank < Formula
  desc "GoCardless JSONSchema template generator"
  homepage "https://github.com/gocardless/crank"
  version "4"

  if OS.mac?
    url "https://github.com/gocardless/crank/releases/download/vdaf95a2/crank_darwin_amd64", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "90d8c852c917d2ac15c0821bacc2e2835d8f7ff67cf4e750acb61ad43e9faf08"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/crank/releases/download/vdaf95a2/crank_linux_amd64", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "0c77d0056a9d907f286febf6d9822825f492cf845341b41070623be2107b6ddb"
    end
  end

  def install
    if OS.mac?
      bin.install "crank_darwin_amd64" => "crank"
    elsif OS.linux?
      bin.install "crank_linux_amd64" => "crank"
    end
  end

  test do
    assert_equal(shell_output("#{bin}/crank").first(17), "crank Git version")
  end
end
