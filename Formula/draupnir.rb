# This file was generated by GoReleaser. DO NOT EDIT.
class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage ""
  version "5.2.2"

  if OS.mac?
    url "https://github.com/gocardless/draupnir/releases/download/v5.2.2/draupnir_5.2.2_darwin_amd64.tar.gz"
    sha256 "cdf20b21b479e5bc5040daf3879f12216ec71173048aadf4892625f8002d5c9d"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/gocardless/draupnir/releases/download/v5.2.2/draupnir_5.2.2_linux_amd64.tar.gz"
      sha256 "b2631b454d3b31de2c6e57ac53be005486f71fa0fe54c33209f741e082fe297c"
    end
  end

  def install
    bin.install "draupnir"
  end

  test do
    system "draupnir-client help"
  end
end
