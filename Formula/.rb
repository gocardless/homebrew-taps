class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  url "https://github.com/gocardless/anu/releases/download/v0.0.2/anu_0.0.2_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.0.2"
  sha256 "f5e54723f293a4030bd90dee7bd1b4b5870920dcff7dd4b704c3509a684cf0da"

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
