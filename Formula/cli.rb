# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Cli < Formula
  desc "GoCardless CLI"
  homepage "https://github.com/gocardless/cli-releases"
  version "1.0.0-beta.5"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/cli-releases/releases/download/v1.0.0-beta.5/cli_1.0.0-beta.5_macOS_x86_64.tar.gz"
      sha256 "0fdc20ae6084e75b80299e7cdff2629346e72775a225f9df8b8703d4a8c376c2"

      def install
        bin.install "gc"
        bin.install_symlink "gc" => "gocardless"

        # Install shell auto-completion
        (bash_completion/"gc").write(Utils.popen_read("#{bin}/gc completion bash"))
        (zsh_completion/"_gc").write(Utils.popen_read("#{bin}/gc completion zsh"))
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/cli-releases/releases/download/v1.0.0-beta.5/cli_1.0.0-beta.5_macOS_arm64.tar.gz"
      sha256 "cae5888949037aa0ace4c6df4e4f3063f5464cbab9157c2a485bd48d0ec8f708"

      def install
        bin.install "gc"
        bin.install_symlink "gc" => "gocardless"

        # Install shell auto-completion
        (bash_completion/"gc").write(Utils.popen_read("#{bin}/gc completion bash"))
        (zsh_completion/"_gc").write(Utils.popen_read("#{bin}/gc completion zsh"))
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/gocardless/cli-releases/releases/download/v1.0.0-beta.5/cli_1.0.0-beta.5_Linux_arm64.tar.gz"
      sha256 "566deacb7e0429746851a36821f3bf320d4453149a5f6a0b5b7d76004bfd534d"

      def install
        bin.install "gc"
        bin.install_symlink "gc" => "gocardless"

        # Install shell auto-completion
        (bash_completion/"gc").write(Utils.popen_read("#{bin}/gc completion bash"))
        (zsh_completion/"_gc").write(Utils.popen_read("#{bin}/gc completion zsh"))
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/cli-releases/releases/download/v1.0.0-beta.5/cli_1.0.0-beta.5_Linux_x86_64.tar.gz"
      sha256 "b538acf17934cc67d93176c63b4b58b543c4148b7298368d1305db6ed1e00974"

      def install
        bin.install "gc"
        bin.install_symlink "gc" => "gocardless"

        # Install shell auto-completion
        (bash_completion/"gc").write(Utils.popen_read("#{bin}/gc completion bash"))
        (zsh_completion/"_gc").write(Utils.popen_read("#{bin}/gc completion zsh"))
      end
    end
  end

  test do
    system "#{bin}/gc version"
  end
end
