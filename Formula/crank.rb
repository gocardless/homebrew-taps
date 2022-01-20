require_relative "../lib/gc/github_private_release_download_strategy"

class Crank < Formula
  desc "GoCardless JSONSchema template generator"
  homepage "https://github.com/gocardless/crank"
  version "2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/crank/releases/download/v1b61d42/crank_darwin_amd64", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "431b197d0ce53b903b92220ec68a97cdd035fdea6201bd24adf86e0d51f917fe"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/crank/releases/download/v1b61d42/crank_linux_amd64", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "ca99dadbaf025b61c365576bedfbcc8aea2026fc06db33b2fa018fa775f030da"
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
