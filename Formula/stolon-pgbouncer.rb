# This file was generated by GoReleaser. DO NOT EDIT.
class StolonPgbouncer < Formula
  desc "Stolon add-on for running PgBouncer"
  homepage "https://github.com/gocardless/stolon-pgbouncer"
  url "https://github.com/gocardless/stolon-pgbouncer/releases/download/v0.1.1/stolon-pgbouncer_0.1.1_darwin_amd64.tar.gz"
  version "0.1.1"
  sha256 "ca4915d25fb5e2eea37af1c5ddb2bb4efbcc26eb15eeae2cfc34a8a4462c2f33"

  def install
    bin.install "stolon-pgbouncer"
  end
end
