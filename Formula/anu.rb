# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  url "https://github.com/gocardless/anu/releases/download/v4.3.1/anu_4.3.1_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
  version "4.3.1"
  sha256 "27c86b899c415d0c4b13331df9c5a6785f6c2b99146c8ab873d38f09d6613730"

  def install
    bin.install "anu"
    bin.install "anu-terraform"
    
    # Install shell auto-completion
    (bash_completion/"anu").write(Utils.popen_read("#{bin}/anu completion bash"))
    (zsh_completion/"_anu").write(Utils.popen_read("#{bin}/anu completion zsh"))
  end

  def caveats; <<~EOS
    Check https://github.com/gocardless/anu for how to configure anu
  EOS
  end

  test do
    system "#{bin}/anu version"
  end
end
