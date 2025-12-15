class Kubebuilder < Formula
  desc "SDK for building Kubernetes APIs using CRDs"
  homepage "https://github.com/kubernetes-sigs/kubebuilder"
  version "2.3.1"
  url "https://go.kubebuilder.io/dl/#{version}/darwin/amd64"
  sha256 "39314d45053b6c31eb17e35c9b8d923f8a38277a9a136448345dd4b7f0f308f4"

  def install
    bin.install "bin/kubebuilder"
    (prefix/"assets").install Dir["bin/*"]
  end

  def caveats; <<~EOS
    Additional kubebuilder components are installed in /usr/local/Cellar/kubebuilder/bin.
    If you use tooling such as `envtest` you may want to add the following line to your profile or shell init script.
    
        export KUBEBUILDER_ASSETS="#{prefix}/assets"

  EOS
  end

  test do
    system "#{bin}/kubebuilder", "version"
  end
end
