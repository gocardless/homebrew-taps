class Crank < Formula
  desc "A tool for building content based on our JSON schema and a template"
  homepage "https://github.com/gocardless/crank"
  url "https://github.com/gocardless/crank/releases/download/v1.0.3/crank_Darwin_x86_64.tar.gz"
  version "1.0.3"
  sha256 "7b15b05576f9a98314fb8a375d0e0128118c39f94de152de8e50e5f6dfc0f4cf"

  def install
    bin.install "crank"
  end

  def caveats
    "A tool for building content based on our JSON schema and a template"
  end
end
