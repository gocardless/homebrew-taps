class Kubeval < Formula
  desc "Validate your Kubernetes configuration files, supports multiple Kubernetes versions"
  homepage "https://kubeval.instrumenta.dev"
  url "https://github.com/instrumenta/kubeval/releases/download/0.14.0/kubeval-darwin-amd64.tar.gz"
  version "0.14.0"
  sha256 "05b9993e59a32b95bc5496dd98598e4a425643151efd108c0449405dd4a2a4c7"

  def install
    bin.install "kubeval"
  end

  test do
    system "#{bin}/kubeval", "--version"
  end
end
