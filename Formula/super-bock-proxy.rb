# frozen_string_literal: true

require_relative "../lib/gc/github_private_release_download_strategy"

class SuperBockProxy < Formula
  desc "Local IAP-authenticating reverse proxy for Claude Code (LiteLLM)"
  homepage "https://github.com/gocardless/super-bock-proxy-releases"
  version "1.4.0-g1ab8275"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/super-bock-proxy-releases/releases/download/v1.4.0-g1ab8275/super-bock-proxy_1.4.0-g1ab8275_darwin_arm64.tar.gz",
          using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "f27e561c808e24c68bb764b4f62a506be7010ae003b114a2ab60a30d5c08a163"
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/super-bock-proxy-releases/releases/download/v1.4.0-g1ab8275/super-bock-proxy_1.4.0-g1ab8275_darwin_amd64.tar.gz",
          using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "8a9a2daefb9f249a71c9e8b2964f2a68ff9ff747a1f7d2c6d29f0883c95cbf1d"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/gocardless/super-bock-proxy-releases/releases/download/v1.4.0-g1ab8275/super-bock-proxy_1.4.0-g1ab8275_linux_amd64.tar.gz",
          using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "abb1edd793a687cac9922fb2041bffc31daf36a22741485ed0b2e833049cf675"
    end
  end

  def install
    bin.install "super-bock-proxy"
    pkgshare.install "api-key-helper.sh"
  end

  service do
    run [opt_bin/"super-bock-proxy", "-env=dev", "-brand=external"]
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
