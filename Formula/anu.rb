class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  url "https://github.com/gocardless/anu/releases/download/v2.2.1/anu_2.2.1_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "2.2.1"
  sha256 "6b0e4a80d6732160ade4c10a2eed56f1c881153bd3cfbea8621238d875aa123e"

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
