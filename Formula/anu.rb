# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  url "https://github.com/gocardless/anu/releases/download/v5.0.2/anu_5.0.2_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
  version "5.0.2"
  sha256 "21c1ed6dac18aaefbdcd0f3614dfe8fca00ece9be71ad8e86c8434774835ed62"

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
