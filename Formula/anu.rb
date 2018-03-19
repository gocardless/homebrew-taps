class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  url "https://github.com/gocardless/anu/releases/download/v0.0.6/anu_0.0.6_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.0.6"
  sha256 "1a57b4dfb44303a2f2fdba348f9a3b38de52e2fcafb0b79c58bc895ed6415bcb"

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
