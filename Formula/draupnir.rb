# frozen_string_literal: true

class Draupnir < Formula
  desc "Client for the draupnir database service"
  homepage ""
  url "https://github.com/gocardless/draupnir/releases/download/v2.0.1/draupnir_2.0.1_darwin_amd64.tar.gz"
  version "2.0.1"
  sha256 "95fe8e17f0d298c096ca353fb6a23ddd3c8d98c00411a922afada00a35c87d75"

  def install
    bin.install "draupnir-client"
  end

  test do
    system "draupnir-client help"
  end
end
