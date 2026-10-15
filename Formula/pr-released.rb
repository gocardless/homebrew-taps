# frozen_string_literal: true

class PrReleased < Formula
  desc "Check whether a GitHub PR has been deployed, per environment"
  homepage "https://github.com/gocardless/pr-released-bot"
  url "git@github.com:gocardless/pr-released-bot.git",
    using:    GitDownloadStrategy,
    tag:      "0.0.7",
    revision: "1031e7a39c200340a6977b432cbaf897957cca6e"
  version "0.0.7"

  depends_on "gh"

  def install
    bin.install "pr-released"
  end

  test do
    system "bash", "-n", bin/"pr-released"
  end
end
