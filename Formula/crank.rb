require_relative "../lib/gc/github_private_release_download_strategy"

class Crank < Formula
  desc "GoCardless JSONSchema template generator"
  homepage "https://github.com/gocardless/crank"
  version "1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/crank/releases/download/vfa380ab/crank_darwin_amd64", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "025e3f4fdb7701eb72ce124fb76eb89fabebd29301b6a943b791ed432d7aef19"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/crank/releases/download/vfa380ab/crank_linux_amd64", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "51608ebc45067369c009d6fdf3d9de5c9c8bfe5c1bdcada94f0c94ed38df1592"
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
