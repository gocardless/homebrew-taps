# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  version "18.1.2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/anu/releases/download/v18.1.2/anu_18.1.2_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "8339375ab230e10360f88a0e90abc7a6111e3fc694f5e2d52b07673f08717924"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/anu/releases/download/v18.1.2/anu_18.1.2_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "39a32b3a930787a60a23f029cda2909a4f2384c8f6406e4b3565c5023e84a7d5"
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
