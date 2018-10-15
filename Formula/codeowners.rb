class Codeowners < Formula
  desc "GoCardless code ownership tool"
  homepage "https://github.com/gocardless/gc-owners"
  url "https://github.com/gocardless/codeowners/releases/download/v0.0.1/codeowners_0.0.1_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.0.1"
  sha256 "fbfb5cc0eb9cd622f9c4e943239c2f7c58a92dcf1c36f92d159602bce753c24d"

  def install
    bin.install "gc-owners"
  end

  test do
    system "#{bin}/gc-owners version"
  end
end
