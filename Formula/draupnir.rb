# frozen_string_literal: true

class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage "https://github.com/gocardless/draupnir"
  url "https://s3-eu-west-1.amazonaws.com/gocardless-tools/draupnir-client-0.1.4.zip"
  sha256 "ea7f984b265ce6cdd7bbbb90a8d91ac6347a14d0fd7d3d70f9c0cf36e176ddc6"
  version "0.1.4"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
