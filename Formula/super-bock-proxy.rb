# frozen_string_literal: true

require_relative "../lib/gc/github_private_release_download_strategy"

class SuperBockProxy < Formula
  desc "Local IAP-authenticating reverse proxy for Claude Code (LiteLLM)"
  homepage "https://github.com/gocardless/super-bock-proxy-releases"
  version "1.4.0-g1ab8275-dirty"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/super-bock-proxy-releases/releases/download/v1.4.0-g1ab8275-dirty/super-bock-proxy_1.4.0-g1ab8275-dirty_darwin_arm64.tar.gz",
          using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "057ee95bfd81accf254238ce71841ecaa0ef8ef31bd7a1d0033485b6df9ca8a1"
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/super-bock-proxy-releases/releases/download/v1.4.0-g1ab8275-dirty/super-bock-proxy_1.4.0-g1ab8275-dirty_darwin_amd64.tar.gz",
          using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "1e648fd31575e4e932d35b8cf193ca25fa06bbbd20de50165436e0f77b329d77"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/gocardless/super-bock-proxy-releases/releases/download/v1.4.0-g1ab8275-dirty/super-bock-proxy_1.4.0-g1ab8275-dirty_linux_amd64.tar.gz",
          using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "019ed00fa07311c6de253e13e4481c5387a82b5efc888362ac06362085ea9293"
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
