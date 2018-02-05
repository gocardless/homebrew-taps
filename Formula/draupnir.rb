class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage ""
  url "https://github.com/gocardless/draupnir/releases/download/v1.5.0/draupnir_1.5.0_darwin_amd64.tar.gz"
  version "1.5.0"
  sha256 "10f37fe9256b92fb3a7dea1c204f8c4010b550ca76b7062e98a7bbd887bff3f7"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
