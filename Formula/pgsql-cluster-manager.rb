class PgsqlClusterManager < Formula
  desc "Orchestrator for Postgres clustering with corosync/pacemaker/etcd"
  homepage "https://github.com/gocardless/pgsql-cluster-manager"
  url "https://github.com/gocardless/pgsql-cluster-manager/releases/download/v0.0.7/pgsql-cluster-manager_0.0.7_darwin_amd64.tar.gz"
  version "0.0.7"
  sha256 "7e56bf61ab1e9a395665bf991a48ff55e4e3878af5c271fe5324dfc744053a76"

  def install
    bin.install "pgsql-cluster-manager"
  end

  test do
    
  end
end
