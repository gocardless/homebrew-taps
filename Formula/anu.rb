# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  version "12.5.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/anu/releases/download/v12.5.0/anu_12.5.0_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "9fcfacedcdb9d7ceb0b6f66e613291c42c2cb2e31684b703ac4ee8546caa6c29"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/anu/releases/download/v12.5.0/anu_12.5.0_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "476fb230b90b294e27656459053aaa3410654760c0143000320391b1384c94de"
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
