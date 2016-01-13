class Logsearch < Formula
  desc "Search Elasticsearch logs from the command line"
  homepage "https://github.com/gocardless/logsearch"
  url "https://github.com/gocardless/logsearch/releases/download/v0.3/logsearch-0.3.darwin-amd64.tgz"
  version "0.3"
  sha256 "660b7ac49a00cf9e47b1e7f56d81f610cc50efc8a5ebbf69fe49ac8a729a49f6"

  def install
    bin.install "logsearch"
  end
end
