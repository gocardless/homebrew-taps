# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  version "10.2.0"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/anu/releases/download/v10.2.0/anu_10.2.0_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "8f974f6d5ab3556049a1894d07845ad4cb8b02fa1b3189fe82c93d651b2f2b70"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/anu/releases/download/v10.2.0/anu_10.2.0_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "a4a998e141392b0c9202afc67749034ec0dbf0aaa6267231d407ce86d4466c80"
    end
  end
  
  depends_on "kubernetes-cli"
  depends_on "fzf"

  def install
    bin.install "anu"
    bin.install "anu-terraform"
    bin.install "utopia"
    
    # Install shell auto-completion
    (bash_completion/"anu").write(Utils.popen_read("#{bin}/anu completion bash"))
    (zsh_completion/"_anu").write(Utils.popen_read("#{bin}/anu completion zsh"))
    (bash_completion/"utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-bash"))
    (zsh_completion/"_utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-zsh"))
  end

  def caveats; <<~EOS
    Check https://github.com/gocardless/anu for how to configure anu
  EOS
  end

  test do
    system "#{bin}/anu version"
  end
end
