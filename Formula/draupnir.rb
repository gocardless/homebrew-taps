class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage ""
  url "https://github.com/gocardless/draupnir/releases/download/v1.2.0/draupnir_1.2.0_darwin_amd64.tar.gz"
  version "1.2.0"
  sha256 "952b78db63f92b2dc4d8c437bb027bb5463c37b58ec2b46f0178ad777c1a7cfc"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
