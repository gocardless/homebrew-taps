class Logsearch < Formula
  desc "Search Elasticsearch logs from the command line"
  homepage "https://github.com/gocardless/logsearch"
  url "https://github.com/gocardless/logsearch/releases/download/v0.4/logsearch-0.4.darwin-amd64.tgz"
  version "0.4"
  sha256 "d7d4f6c9b70bd337b31f93fcc3f7b8d7134f132cde43fc9028297694808b18da"

  def install
    bin.install "logsearch"
  end
end
