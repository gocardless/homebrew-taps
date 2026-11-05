# frozen_string_literal: true

require_relative "../lib/gc/github_private_release_download_strategy"

class SuperBockProxy < Formula
  desc "Local IAP-authenticating reverse proxy for Claude Code (LiteLLM)"
  homepage "https://github.com/gocardless/super-bock-proxy-releases"
  version "1.4.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/super-bock-proxy-releases/releases/download/v1.4.0/super-bock-proxy_1.4.0_darwin_arm64.tar.gz",
          using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "e2a073688c28ee0432767e2abf73ef542a203e7ec18dfa0f1717277dee865d97"
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/super-bock-proxy-releases/releases/download/v1.4.0/super-bock-proxy_1.4.0_darwin_amd64.tar.gz",
          using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "fcd6032cfc3f0ee5524655edecb6fc10ec6a9ecd364083a97336599cacd7b6b1"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/gocardless/super-bock-proxy-releases/releases/download/v1.4.0/super-bock-proxy_1.4.0_linux_amd64.tar.gz",
          using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "0d16aaeba28c2640311b270077cc3fa47bf0728770d4b7b6f6ecfe8709116e49"
    end
  end

  def install
    bin.install "super-bock-proxy"
    pkgshare.install "api-key-helper.sh"
  end

  service do
    run [opt_bin/"super-bock-proxy"]
    keep_alive true
    log_path var/"log/super-bock-proxy.log"
    error_log_path var/"log/super-bock-proxy.log"
  end

  def caveats
    <<~EOS
      Start the proxy (and have it start at login) with:
        brew services start super-bock-proxy

      Point Claude Code at it in ~/.claude/settings.json:
        "apiKeyHelper": "#{opt_pkgshare}/api-key-helper.sh",
        "env": { "ANTHROPIC_BASE_URL": "http://localhost:1337" }

      Verify with: curl http://127.0.0.1:1337/health
    EOS
  end

  test do
    assert_match "Usage: super-bock-proxy", shell_output("#{bin}/super-bock-proxy help")
  end
end
