class PgsqlClusterManager < Formula
  desc "Orchestrator for Postgres clustering with corosync/pacemaker/etcd"
  homepage "https://github.com/gocardless/pgsql-cluster-manager"
  url "https://github.com/gocardless/pgsql-cluster-manager/releases/download/v0.0.6/pgsql-cluster-manager_0.0.6_darwin_amd64.tar.gz"
  version "0.0.6"
  sha256 "6a487048beac59a6445cd0015f0ba00c74017f08949b2be33efbd2d2d1bd51e5"

  def install
    bin.install "pgsql-cluster-manager"
  end

  test do
    
  end
end
