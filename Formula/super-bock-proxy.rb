# frozen_string_literal: true

require_relative "../lib/gc/github_private_release_download_strategy"

class SuperBockProxy < Formula
  desc "Local IAP-authenticating reverse proxy for Claude Code (LiteLLM)"
  homepage "https://github.com/gocardless/super-bock-proxy-releases"
  version "1.5.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/gocardless/super-bock-proxy-releases/releases/download/v1.5.0/super-bock-proxy_1.5.0_darwin_arm64.tar.gz",
          using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "755e19001ad0664b12490ad3a3eff89aa315b1d3eddb01d0fb11bb41c85d0bd5"
    end
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/super-bock-proxy-releases/releases/download/v1.5.0/super-bock-proxy_1.5.0_darwin_amd64.tar.gz",
          using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "daf47898135ae793f679273fbcb031b12444401daa7a08a449f697b171c69890"
    end
  end

  on_linux do
    if Hardware::CPU.intel? && Hardware::CPU.is_64_bit?
      url "https://github.com/gocardless/super-bock-proxy-releases/releases/download/v1.5.0/super-bock-proxy_1.5.0_linux_amd64.tar.gz",
          using: Gc::GithubPrivateReleaseDownloadStrategy
      sha256 "f36abd974a3c095cbf93896879736a890266e5e4502a10e90314574c918ce5c0"
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
