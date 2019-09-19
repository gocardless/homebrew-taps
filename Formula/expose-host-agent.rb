# frozen_string_literal: true

require_relative "../lib/gc/github_private_release_download_strategy"

class ExposeHostAgent < Formula
  desc "Wrapper command that exposes your local SSH agent for use during docker builds"
  homepage "https://github.com/gocardless/expose-host-agent"
  url "git@github.com:gocardless/expose-host-agent.git", :using => GitDownloadStrategy, :ref_type => :tag, :revision => "v0.0.1"
  version "0.0.1"
  sha256 "44418172f3803a988c4c114989259ffa7087298203afb7b7a3277fc30c65bb99"

  depends_on "socat"

  def install
    bin.install "bin/expose-host-agent"
  end
end
