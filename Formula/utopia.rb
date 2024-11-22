# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class Utopia < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/utopia"
  version "33.2.1"

  depends_on "argocd"
  depends_on "bash"
  depends_on "fzf"
  depends_on "kubernetes-cli"
  depends_on "yq"

  on_macos do
    on_intel do
      url "https://github.com/gocardless/utopia/releases/download/v33.2.1/utopia_33.2.1_darwin_amd64.tar.gz", using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "4028b3740edd0de74fe8d74ff4c7dc27e717c30a0638c485d656e918581dffee"

      def install
        bin.install "utopia"

        # Install shell auto-completion
        (bash_completion/"utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-bash"))
        (zsh_completion/"_utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-zsh").strip)
      end
    end
    on_arm do
      url "https://github.com/gocardless/utopia/releases/download/v33.2.1/utopia_33.2.1_darwin_arm64.tar.gz", using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "89fb53c59b11bfb2ec33b2075ff1cf1da54e64a3276366f669084ce8a860674b"

      def install
        bin.install "utopia"

        # Install shell auto-completion
        (bash_completion/"utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-bash"))
        (zsh_completion/"_utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-zsh").strip)
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/gocardless/utopia/releases/download/v33.2.1/utopia_33.2.1_linux_amd64.tar.gz", using: Gc::GithubPrivateReleaseDownloadStrategy
        sha256 "e650e82c268cd47b51c65678892a2b0dd16debc29f115c66ef64d4cf8928bffd"

        def install
          bin.install "utopia"

          # Install shell auto-completion
          (bash_completion/"utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-bash"))
          (zsh_completion/"_utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-zsh").strip)
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/gocardless/utopia/releases/download/v33.2.1/utopia_33.2.1_linux_arm64.tar.gz", using: Gc::GithubPrivateReleaseDownloadStrategy
        sha256 "599468fe093a52c8af0d19e3b6ebecaafd6ef0fef49eede1389efe6263ca0b78"

        def install
          bin.install "utopia"

          # Install shell auto-completion
          (bash_completion/"utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-bash"))
          (zsh_completion/"_utopia").write(Utils.popen_read("#{bin}/utopia --completion-script-zsh").strip)
        end
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
