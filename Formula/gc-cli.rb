# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
require_relative "../lib/gc/github_private_release_download_strategy"
class GcCli < Formula
  desc "GoCardless CLI"
  homepage "https://github.com/gocardless/gc-cli"
  version "0.0.1-rc2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/gc-cli/releases/download/v0.0.1-rc2/gc-cli_0.0.1-rc2_masOS_arm64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "450a43c60b65de76d595e389b28c32eb9b9a87ac0dd5003f187f9318b32d9fda"

      def install
        bin.install "gc"

        # Install shell auto-completion
        (bash_completion/"gc").write(Utils.popen_read("#{bin}/gc completion bash"))
        (zsh_completion/"_gc").write(Utils.popen_read("#{bin}/gc completion zsh"))
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/gc-cli/releases/download/v0.0.1-rc2/gc-cli_0.0.1-rc2_masOS_x86_64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "d3835fbb6f593203891652141938ce5267231ad4dc203d3463647da1d63ba3a7"

      def install
        bin.install "gc"

        # Install shell auto-completion
        (bash_completion/"gc").write(Utils.popen_read("#{bin}/gc completion bash"))
        (zsh_completion/"_gc").write(Utils.popen_read("#{bin}/gc completion zsh"))
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gocardless/gc-cli/releases/download/v0.0.1-rc2/gc-cli_0.0.1-rc2_Linux_arm64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "d46b6d38d264e1b00539f15daf509abac5f7b7401d2b47e298893227b6cdcdb0"

      def install
        bin.install "gc"

        # Install shell auto-completion
        (bash_completion/"gc").write(Utils.popen_read("#{bin}/gc completion bash"))
        (zsh_completion/"_gc").write(Utils.popen_read("#{bin}/gc completion zsh"))
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/gc-cli/releases/download/v0.0.1-rc2/gc-cli_0.0.1-rc2_Linux_x86_64.tar.gz", :using => Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "f8b31e9b9db3223c37abaf533705fd102d9f4e2daacc9b63df3f3f81c260af41"

      def install
        bin.install "gc"

        # Install shell auto-completion
        (bash_completion/"gc").write(Utils.popen_read("#{bin}/gc completion bash"))
        (zsh_completion/"_gc").write(Utils.popen_read("#{bin}/gc completion zsh"))
      end
    end
  end

  def caveats; <<~EOS
    Check https://github.com/gocardless/gc-cli for how to configure the gocardless cli
  EOS
  end

  test do
    system "#{bin}/gc version"
  end
end
