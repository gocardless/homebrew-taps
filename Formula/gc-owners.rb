class GcOwners < Formula
  desc "GoCardless code ownership tool"
  homepage "https://github.com/gocardless/gc-owners"
  url "https://github.com/gocardless/codeowners/releases/download/v0.0.4/codeowners_0.0.4_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.0.4"
  sha256 "7a9d418c919d7be0e8d2e30f694a827c5b1ca70cee39fddb82a77a2de0c4166a"

  def install
    bin.install "gc-owners"
  end

  test do
    system "#{bin}/gc-owners version"
  end
end
