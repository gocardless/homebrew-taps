class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  url "https://github.com/gocardless/anu/releases/download/v2.1.0/anu_2.1.0_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "2.1.0"
  sha256 "b27db48f4da9787cdc0cdc199bcd91e97ba00a7fdc370f81938bb3c5e0a174c4"

  def install
    bin.install "anu"
    
    # Install shell auto-completion
    (bash_completion/"anu").write(Utils.popen_read("#{bin}/anu completion bash"))
    (zsh_completion/"_anu").write(Utils.popen_read("#{bin}/anu completion zsh"))
  end

  def caveats; <<~EOS
    Check https://github.com/gocardless/anu for how to configure anu
  EOS
  end

  test do
    system "#{bin}/anu version"
  end
end
