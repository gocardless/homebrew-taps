class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage ""
  url "https://github.com/gocardless/draupnir/releases/download/v3.0.0/draupnir_3.0.0_darwin_amd64.tar.gz"
  version "3.0.0"
  sha256 "4bec566db73fec672ca6e51ad23fdfc9a367ab260016afa4b0a9dac77621c5a7"

  def install
    bin.install "draupnir"
  end

  test do
    system "draupnir-client help"
  end
end
