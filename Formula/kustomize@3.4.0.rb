class KustomizeAT340 < Formula
  # Taken from https://github.com/Homebrew/homebrew-core/blob/c389f2500adbd6813df2b1d26645e9c774d2399f/Formula/kustomize.rb
  desc "Template-free customization of Kubernetes YAML manifests"
  homepage "https://github.com/kubernetes-sigs/kustomize"
  url "https://github.com/kubernetes-sigs/kustomize.git",
      :tag      => "kustomize/v3.4.0",
      :revision => "2c9635967a2b1469d605a91a1d040bd27c73ca7d"
  head "https://github.com/kubernetes-sigs/kustomize.git"

  depends_on "go" => :build

  def install
    revision = Utils.popen_read("git", "rev-parse", "HEAD").strip

    cd "kustomize" do
      ldflags = %W[
        -s -X sigs.k8s.io/kustomize/api/provenance.version=#{version}
        -X sigs.k8s.io/kustomize/api/provenance.gitCommit=#{revision}
        -X sigs.k8s.io/kustomize/api/provenance.buildDate=#{Time.now.iso8601}
      ]
      system "go", "build", "-ldflags", ldflags.join(" "), "-o", bin/"kustomize"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/kustomize version")

    (testpath/"kustomization.yaml").write <<~EOS
      resources:
      - service.yaml
      patchesStrategicMerge:
      - patch.yaml
    EOS
    (testpath/"patch.yaml").write <<~EOS
      apiVersion: v1
      kind: Service
      metadata:
        name: brew-test
      spec:
        selector:
          app: foo
    EOS
    (testpath/"service.yaml").write <<~EOS
      apiVersion: v1
      kind: Service
      metadata:
        name: brew-test
      spec:
        type: LoadBalancer
    EOS
    output = shell_output("#{bin}/kustomize build #{testpath}")
    assert_match /type:\s+"?LoadBalancer"?/, output
  end
end
