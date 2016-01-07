class Logsearch < Formula
  desc "Search Elasticsearch logs from the command line"
  homepage "https://github.com/gocardless/logsearch"
  url "https://github.com/gocardless/logsearch/releases/download/v0.1/logsearch-0.1.darwin-amd64.tgz"
  version "64"
  sha256 "74df603c56aa3cfb6ef26d4777f93242d21e64c2f3058833b2ccc5f5fbc85113"

  def install
    bin.install "logsearch"
  end
end
