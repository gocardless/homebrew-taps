# frozen_string_literal: true

class PrReleased < Formula
  desc "Check whether a GitHub PR has been deployed, per environment"
  homepage "https://github.com/gocardless/pr-released-bot"
  url "git@github.com:gocardless/pr-released-bot.git",
    using:    GitDownloadStrategy,
    tag:      "0.0.2",
    revision: "c81f6575363629ad616c4c5d4f8f3eb3a8a14dea"
  version "0.0.2"

  depends_on "gh"

  def install
    bin.install "pr-released"
  end

  test do
    system "bash", "-n", bin/"pr-released"
  end
end
