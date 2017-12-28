class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage ""
  url "https://github.com/gocardless/draupnir/releases/download/v1.1.0/draupnir_1.1.0_darwin_amd64.tar.gz"
  version "1.1.0"
  sha256 "17846ac0681533357cde15c6869c0b0f10438a070d6987a7326d365b0dda4213"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
