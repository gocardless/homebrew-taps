# This file was generated by GoReleaser. DO NOT EDIT.
class StolonPgbouncer < Formula
  desc "Stolon add-on for running PgBouncer"
  homepage "https://github.com/gocardless/stolon-pgbouncer"
  url "https://github.com/gocardless/stolon-pgbouncer/releases/download/v0.1.0/stolon-pgbouncer_0.1.0_darwin_amd64.tar.gz"
  version "0.1.0"
  sha256 "f3b7e51663c19c0a490193d66ad920b5748bae1cda44fd9c8671c5ea5e98bcec"

  def install
    bin.install "stolon-pgbouncer"
  end
end
