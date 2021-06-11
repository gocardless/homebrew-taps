# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  version "25.3.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/anu/releases/download/v25.3.1/anu_25.3.1_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "2dadeaa23785397c55bc477802f5f23bd4c26a73c91c3a643152a427aac5b409"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/anu/releases/download/v25.3.1/anu_25.3.1_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "c17907a60d4a41b8c7b373542b1e0fa7286f1013bc414b14c9dcbec8a0b01677"
    end
  end
  
  depends_on "kubernetes-cli"
  depends_on "fzf"
  depends_on "argocd"

  def install
    bin.install "anu"
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
