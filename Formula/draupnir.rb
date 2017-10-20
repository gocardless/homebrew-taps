# frozen_string_literal: true

class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage "https://github.com/gocardless/draupnir"
  url "https://s3-eu-west-1.amazonaws.com/gocardless-tools/draupnir-client-1.0.0.zip"
  sha256 "a8c843f7f720562d16b7d93cbdcf81db704c9abbcf4aec6362e7a0156e6fe25b"
  version "1.0.0"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
