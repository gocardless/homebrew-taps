# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  version "31.3.6"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/anu/releases/download/v31.3.6/anu_31.3.6_darwin_arm64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "36255609b481741d0c0ec854290b5439585f04a0806cbadd50b8aa8edb5c33dc"

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
      url "https://github.com/gocardless/anu/releases/download/v31.3.6/anu_31.3.6_darwin_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "1c3f69a05bee092be43ad191bdd4c67ced50e17cd3568fdaedeac7a030889c4a"

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
      url "https://github.com/gocardless/anu/releases/download/v31.3.6/anu_31.3.6_linux_amd64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "af3998842cd100c12ad5688da6b8bad6b9073deba16f6058dbb5ee45ddf9e8fb"

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
