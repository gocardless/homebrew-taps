# This file was generated by GoReleaser. DO NOT EDIT.
class StolonPgbouncer < Formula
  desc "Stolon add-on for running PgBouncer"
  homepage "https://github.com/gocardless/stolon-pgbouncer"
  url "https://github.com/gocardless/stolon-pgbouncer/releases/download/v1.0.0/stolon-pgbouncer_1.0.0_darwin_amd64.tar.gz"
  version "1.0.0"
  sha256 "0e2497e05224189a5091b651c0a7886dfaecf6f30c1789796959cfd5b615c1f3"

  def install
    bin.install "stolon-pgbouncer"
  end
end
