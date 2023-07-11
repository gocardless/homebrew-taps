# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Utopia < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/utopia"
  version "31.9.0"

  depends_on "argocd"
  depends_on "bash"
  depends_on "fzf"
  depends_on "kubernetes-cli"
  depends_on "yq"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/utopia/releases/download/v31.9.0/utopia_31.9.0_darwin_arm64.tar.gz", using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "07b5ad75cd76c3e8cf3086ae84b4984b6f3930527f28eff13e89cb76b0795fdd"

      def install
        bin.install "utopia"

        # Install shell auto-completion
        (bash_completion/"utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-bash"))
        (zsh_completion/"_utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-zsh").strip)
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/utopia/releases/download/v31.9.0/utopia_31.9.0_darwin_amd64.tar.gz", using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "d8cbbe86e8909313f93690f85e99873f76924621d0fb46e5e4d6793bdb70517f"

      def install
        bin.install "utopia"

        # Install shell auto-completion
        (bash_completion/"utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-bash"))
        (zsh_completion/"_utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-zsh").strip)
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/utopia/releases/download/v31.9.0/utopia_31.9.0_linux_amd64.tar.gz", using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "89701275dde081d8039f3e6ff7c849c1b9a971a86f896984abb192ad8c0d0ba7"

      def install
        bin.install "utopia"

        # Install shell auto-completion
        (bash_completion/"utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-bash"))
        (zsh_completion/"_utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-zsh").strip)
      end
    end
  end

  def caveats
    <<~EOS
      Check https://github.com/gocardless/utopia for how to configure utopia
    EOS
  end

  test do
    system "#{bin}/utopia version"
  end
end
