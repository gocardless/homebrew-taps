class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  url "https://github.com/gocardless/anu/releases/download/v4.2.0/anu_4.2.0_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "4.2.0"
  sha256 "fd6cb1061e8f7331f187a44b48c6fb79ed5baadf66bc3045c9e036c26992655a"

  def install
    bin.install "anu"
    bin.install "anu-terraform"
    
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
