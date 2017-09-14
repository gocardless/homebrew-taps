# frozen_string_literal: true

class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage "https://github.com/gocardless/draupnir"
  url "https://s3-eu-west-1.amazonaws.com/gocardless-tools/draupnir-client-0.1.2.zip"
  sha256 "6df6cf5b7e6e211fb629842497427e47ba201dc6cbc311e0d5ddd13f46162f43"
  version "0.1.2"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
