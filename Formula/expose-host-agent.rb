# frozen_string_literal: true

require_relative "../lib/gc/github_private_release_download_strategy"

class ExposeHostAgent < Formula
  desc "Wrapper command that exposes your local SSH agent for use during docker builds"
  homepage "https://github.com/gocardless/expose-host-agent"
  url "git@github.com:gocardless/expose-host-agent.git", :using => GitDownloadStrategy, :ref_type => :tag, :revision => "v0.0.2"
  version "0.0.2"

  depends_on "socat"

  def install
    bin.install "bin/expose-host-agent"
  end
end
