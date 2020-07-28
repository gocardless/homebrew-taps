# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  version "12.2.1"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/gocardless/anu/releases/download/v12.2.1/anu_12.2.1_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
    sha256 "34db6190bf0f9b3b17dc97abc3b529f731b78bdb3e06060ae6b42879e9f1ad44"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/anu/releases/download/v12.2.1/anu_12.2.1_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "b4fb23da2d02c795117cf152accbead5fcbe8adee7c47e9340dd3dc42fcb8c63"
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
