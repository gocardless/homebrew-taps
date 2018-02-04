class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage ""
  url "https://github.com/gocardless/draupnir/releases/download/v1.4.0/draupnir_1.4.0_darwin_amd64.tar.gz"
  version "1.4.0"
  sha256 "cea3d355e99a06a344a7c16a0c8fe283b227bd25f65d37a7bfbf589108837c37"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
