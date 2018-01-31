class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage ""
  url "https://github.com/gocardless/draupnir/releases/download/v1.3.0/draupnir_1.3.0_darwin_amd64.tar.gz"
  version "1.3.0"
  sha256 "3370d02c3183ed7835482eb7231c98b0ea9ed9ea42cb2fbe5ed69c566a3d6045"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
