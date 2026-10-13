# frozen_string_literal: true

class PrReleased < Formula
  desc "Check whether a GitHub PR has been deployed, per environment"
  homepage "https://github.com/gocardless/pr-released-bot"
  url "git@github.com:gocardless/pr-released-bot.git",
    using:    GitDownloadStrategy,
    tag:      "0.0.3",
    revision: "9b85b4bb6d9a554933add8af6e3684807e8488d6"
  version "0.0.3"

  depends_on "gh"

  def install
    bin.install "pr-released"
  end

  test do
    system "bash", "-n", bin/"pr-released"
  end
end
