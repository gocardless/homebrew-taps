# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  version "27.0.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/anu/releases/download/v27.0.0/anu_27.0.0_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "264adee5b520f1eacf53d3bb2d4f512d1e4f59cf9c2702ccdfe3735f2355a8d1"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/anu/releases/download/v27.0.0/anu_27.0.0_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "02557c23f25148b67e152bf68cd30ae20e30da1d4a179ac669ba72023ffee1c5"
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
