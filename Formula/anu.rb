class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  url "https://github.com/gocardless/anu/releases/download/v0.0.4/anu_0.0.4_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.0.4"
  sha256 "d0a0b37c46abcd2ed23d23736e0f02e0b9770d5e428dae5718de306ab0c9eecb"

  def install
    bin.install "anu"
  end

  def caveats
    "Check https://github.com/gocardless/anu for how to configure anu"
  end

  test do
    system "#{bin}/anu version"
  end
end
