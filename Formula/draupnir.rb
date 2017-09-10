# frozen_string_literal: true

class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage "https://github.com/gocardless/draupnir"
  url "https://s3-eu-west-1.amazonaws.com/gocardless-tools/draupnir-client-0.1.1.zip"
  sha256 "9dd6cd832a67ef8051fa7e162fe2fcff4387b3cefb4a10ef923189ac277d24cb"
  version "0.1.1"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
