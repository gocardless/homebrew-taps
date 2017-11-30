class PgsqlClusterManager < Formula
  desc "Orchestrator for Postgres clustering with corosync/pacemaker/etcd"
  homepage "https://github.com/gocardless/pgsql-cluster-manager"
  url "https://github.com/gocardless/pgsql-cluster-manager/releases/download/v0.0.5/pgsql-cluster-manager_0.0.5_darwin_amd64.tar.gz"
  version "0.0.5"
  sha256 "f81ada01d87b2a07f45120df17cf7ef96c8a6b7fd1defafbcc211f8088d028b5"

  def install
    bin.install "pgsql-cluster-manager"
  end

  test do
    
  end
end
