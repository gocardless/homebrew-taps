# frozen_string_literal: true

class ExposeHostAgent < Formula
  desc "Wrapper command that exposes your local SSH agent for use during docker builds"
  homepage "https://github.com/gocardless/expose-host-agent"
  url "git@github.com:gocardless/expose-host-agent.git", :using => GitDownloadStrategy, :ref_type => :tag, :revision => "v0.0.3"
  version "0.0.3"

  depends_on "socat"

  def install
    bin.install "bin/expose-host-agent"
  end
end
