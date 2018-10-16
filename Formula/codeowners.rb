class Codeowners < Formula
  desc "GoCardless code ownership tool"
  homepage "https://github.com/gocardless/gc-owners"
  url "https://github.com/gocardless/codeowners/releases/download/v0.0.1/codeowners_0.0.1_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.0.1"
  sha256 "21d1f98e4f68fc324de0f168a3805a7ce3641288b1e90f8022c17af74f1586ee"

  def install
    bin.install "gc-owners"
  end

  test do
    system "#{bin}/gc-owners version"
  end
end
