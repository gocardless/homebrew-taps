class Logsearch < Formula
  desc "Search Elasticsearch logs from the command line"
  homepage "https://github.com/gocardless/logsearch"
  url "https://github.com/gocardless/logsearch/releases/download/v0.2/logsearch-0.2.darwin-amd64.tgz"
  version "0.2"
  sha256 "5dc7b0d106250b357cde7086026f9ed41de74a1ac3d20ee10a20b71900fd90e2"

  def install
    bin.install "logsearch"
  end
end
