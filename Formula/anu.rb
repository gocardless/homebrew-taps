class Anu < Formula
  desc "GoCardless Platform toolkit"
  homepage "https://github.com/gocardless/anu"
  url "https://github.com/gocardless/anu/releases/download/v0.0.5/anu_0.0.5_darwin_amd64.tar.gz", :using => GitHubPrivateRepositoryReleaseDownloadStrategy
  version "0.0.5"
  sha256 "578ccd49212800554f3f76c365d94089572e08ec2be0dd4b5237512fc16c29da"

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
