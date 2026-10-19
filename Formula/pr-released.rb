# frozen_string_literal: true

class PrReleased < Formula
  desc "Check whether a GitHub PR has been deployed, per environment"
  homepage "https://github.com/gocardless/pr-released-bot"
  url "git@github.com:gocardless/pr-released-bot.git",
    using:    GitDownloadStrategy,
    tag:      "0.0.10",
    revision: "42babddc979b23b4a68c28677b7f3179334945ac"
  version "0.0.10"

  depends_on "gh"

  def install
    bin.install "pr-released"
  end

  test do
    system "bash", "-n", bin/"pr-released"
  end
end
