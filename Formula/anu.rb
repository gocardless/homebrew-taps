# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  version "14.2.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/anu/releases/download/v14.2.0/anu_14.2.0_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "006e1034d0901866122ea51ea0be5189e46fb4c2230332567e67299cd213f28d"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/anu/releases/download/v14.2.0/anu_14.2.0_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "3299d12fd394313b1e404155ca546b09aabd4c3441b78ec8eb9fa629978635b0"
    end
  end
  
  depends_on "kubernetes-cli"
  depends_on "fzf"
  depends_on "argocd"

  def install
    bin.install "anu"
    bin.install "anu-terraform"
    bin.install "utopia"
    
    # Install shell auto-completion
    (bash_completion/"anu").write(Utils.popen_read("#{bin}/anu completion bash"))
    (zsh_completion/"_anu").write(Utils.popen_read("#{bin}/anu completion zsh"))
    (bash_completion/"utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-bash"))
    (zsh_completion/"_utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-zsh").strip)
  end

  def caveats; <<~EOS
    Check https://github.com/gocardless/anu for how to configure anu
  EOS
  end

  test do
    system "#{bin}/anu version"
  end
end
