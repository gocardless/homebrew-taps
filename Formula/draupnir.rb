class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage ""
  url "https://github.com/gocardless/draupnir/releases/download/v1.7.0/draupnir_1.7.0_darwin_amd64.tar.gz"
  version "1.7.0"
  sha256 "4da08196953964065226cbf71ccb6a6a7bfb4df2c6bf658cea9a66b0dc558366"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
