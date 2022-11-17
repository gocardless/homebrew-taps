# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  version "31.5.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/anu/releases/download/v31.5.1/anu_31.5.1_darwin_arm64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "975605513f6c180e8dcc30f8da37582a4bb1869052a6a7e2d4f0696e6ab8c1a4"

      def install
        bin.install "anu"
        bin.install "utopia"

        # Install shell auto-completion
        (bash_completion/"anu").write(Utils.popen_read("#{bin}/anu completion bash"))
        (zsh_completion/"_anu").write(Utils.popen_read("#{bin}/anu completion zsh"))
        (bash_completion/"utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-bash"))
        (zsh_completion/"_utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-zsh").strip)
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/anu/releases/download/v31.5.1/anu_31.5.1_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "ebd607a734213a3a288198a8a7baeff7fc70e880202e80f7e6893277d7de6bca"

      def install
        bin.install "anu"
        bin.install "utopia"

        # Install shell auto-completion
        (bash_completion/"anu").write(Utils.popen_read("#{bin}/anu completion bash"))
        (zsh_completion/"_anu").write(Utils.popen_read("#{bin}/anu completion zsh"))
        (bash_completion/"utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-bash"))
        (zsh_completion/"_utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-zsh").strip)
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/anu/releases/download/v31.5.1/anu_31.5.1_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "dced0afb8b8a5225650f665c98f3fad1581f7cd688f07e6849bb7388ea4fc52a"

      def install
        bin.install "anu"
        bin.install "utopia"

        # Install shell auto-completion
        (bash_completion/"anu").write(Utils.popen_read("#{bin}/anu completion bash"))
        (zsh_completion/"_anu").write(Utils.popen_read("#{bin}/anu completion zsh"))
        (bash_completion/"utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-bash"))
        (zsh_completion/"_utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-zsh").strip)
      end
    end
  end

  depends_on "kubernetes-cli"
  depends_on "fzf"
  depends_on "argocd"

  def caveats; <<~EOS
    Check https://github.com/gocardless/anu for how to configure anu
  EOS
  end

  test do
    system "#{bin}/anu version"
  end
end
