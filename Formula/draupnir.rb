class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage ""
  url "https://github.com/gocardless/draupnir/releases/download/v2.0.0/draupnir_2.0.0_darwin_amd64.tar.gz"
  version "2.0.0"
  sha256 "2cd8da94b264e6462eef4eadd5db16db44980e8e6b3a1c33cf9b9f1ae52a33ae"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
