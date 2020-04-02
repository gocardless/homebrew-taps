class Tanka < Formula
  desc "Flexible, reusable and concise configuration for Kubernetes"
  homepage "https://github.com/grafana/tanka"
  url "https://github.com/grafana/tanka/releases/download/v0.8.0/tk-darwin-amd64"
  version "0.8.0"
  sha256 "a05ae4b6b0f51b8d7e3282c81724b9fd153f5bafe85077cdf0fc6787f14f624f"

  def install
    bin.install "tk-darwin-amd64" => "tk"
  end

  def caveats; <<~EOS
    Check https://github.com/grafana/tanka for how to configure tk
  EOS
  end

  test do
    system "#{bin}/tk", "--version"
  end
end
