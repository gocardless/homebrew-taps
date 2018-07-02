class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  url "https://github.com/gocardless/anu/releases/download/v1.0.0/anu_1.0.0_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "1.0.0"
  sha256 "60abf6532b30527311807b800dad24ca0389cdca6b61ffb77f6c2bd888276009"

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
