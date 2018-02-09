class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage ""
  url "https://github.com/gocardless/draupnir/releases/download/v1.6.0/draupnir_1.6.0_darwin_amd64.tar.gz"
  version "1.6.0"
  sha256 "9bc85555203b76721300d16c5b17daae60c59ead64a7e8243b36b0f85e8b213b"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
