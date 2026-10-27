# frozen_string_literal: true

class PrReleased < Formula
  desc "Check whether a GitHub PR has been deployed, per environment"
  homepage "https://github.com/gocardless/pr-released-bot"
  url "git@github.com:gocardless/pr-released-bot.git",
    using:    GitDownloadStrategy,
    tag:      "0.0.14",
    revision: "c3584db5a707dd02347a37206c93712493a97be2"
  version "0.0.14"

  depends_on "gh"

  def install
    bin.install "pr-released"
  end

  test do
    system "bash", "-n", bin/"pr-released"
  end
end
