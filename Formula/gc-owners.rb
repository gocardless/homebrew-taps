class GcOwners < Formula
  desc "GoCardless code ownership tool"
  homepage "https://github.com/gocardless/gc-owners"
  url "https://github.com/gocardless/codeowners/releases/download/v0.0.3/codeowners_0.0.3_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.0.3"
  sha256 "8d29d0ab05e4b75e00524fe5674f18819a0defee4a193350e66af20c81414ae5"

  def install
    bin.install "gc-owners"
  end

  test do
    system "#{bin}/gc-owners version"
  end
end
