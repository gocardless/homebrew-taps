class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  url "https://github.com/gocardless/anu/releases/download/v0.0.9/anu_0.0.9_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.0.9"
  sha256 "d6ea9b48908cf5c2e4cc61c9ecdcb147c9c475d3e58a8f10c312ea267cca21b2"

  def install
    bin.install "anu"
    
    # Install shell auto-completion
    (bash_completion/"anu").write(Utils.popen_read("#{bin}/anu completion bash"))
    (zsh_completion/"_anu").write(Utils.popen_read("#{bin}/anu completion zsh"))
  end

  def caveats
    "Check https://github.com/gocardless/anu for how to configure anu"
  end

  test do
    system "#{bin}/anu version"
  end
end
