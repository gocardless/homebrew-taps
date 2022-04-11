# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Cli < Formula
  desc "GoCardless CLI"
  homepage "https://github.com/gocardless/cli-releases"
  version "1.0.0-beta.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/cli-releases/releases/download/v1.0.0-beta.1/cli_1.0.0-beta.1_macOS_arm64.tar.gz"
      sha256 "4b8009dd341700501d37e89e46be60ddc4021c4418fc08a4a132f15c8a00cbd1"

      def install
        bin.install "gc"
        bin.install_symlink "gc" => "gocardless"

        # Install shell auto-completion
        (bash_completion/"gc").write(Utils.popen_read("#{bin}/gc completion bash"))
        (zsh_completion/"_gc").write(Utils.popen_read("#{bin}/gc completion zsh"))
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/cli-releases/releases/download/v1.0.0-beta.1/cli_1.0.0-beta.1_macOS_x86_64.tar.gz"
      sha256 "4bc22a65c06daf689e13a01459322d91d3bcd251113dc52ae6d6dc675460739f"

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
      url "https://github.com/gocardless/cli-releases/releases/download/v1.0.0-beta.1/cli_1.0.0-beta.1_Linux_arm64.tar.gz"
      sha256 "c5ca349b822342a69e402f1cd8b9af2e67a12c9ae727c595704dafff0313e608"

      def install
        bin.install "gc"
        bin.install_symlink "gc" => "gocardless"

        # Install shell auto-completion
        (bash_completion/"gc").write(Utils.popen_read("#{bin}/gc completion bash"))
        (zsh_completion/"_gc").write(Utils.popen_read("#{bin}/gc completion zsh"))
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/cli-releases/releases/download/v1.0.0-beta.1/cli_1.0.0-beta.1_Linux_x86_64.tar.gz"
      sha256 "0e231a9fd5cd0359f00db8fb7a8aab11e1343c899cd45f82ed7504a86e79319e"

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