class YqAT341 < Formula
  desc "Process YAML documents from the CLI"
  homepage "https://github.com/mikefarah/yq"
  url "https://github.com/mikefarah/yq/archive/v3.4.1.tar.gz"
  sha256 "db9a98525654d7c835989e88d9fcadaafc7b87965d691480cb0300bc2f3248ad"

  bottle do
    cellar :any_skip_relocation
    sha256 "7eef86b614ab9695cb8ba108a659cba5cd504211b7236f8a561c7619aaf9b792" => :catalina
    sha256 "5bf8a07349fcb306261676187d53d684cd14cfafead1a120a95a6318bb8beda9" => :mojave
    sha256 "750248b8af5a72505593466f7add52fd6e20a2c2556dd7e28fc756420618680d" => :high_sierra
  end

  depends_on "go" => :build

  conflicts_with "python-yq", :because => "both install `yq` executables"

  def install
    ENV["GOPATH"] = buildpath
    (buildpath/"src/github.com/mikefarah/yq").install buildpath.children

    cd "src/github.com/mikefarah/yq" do
      system "go", "build", "-o", bin/"yq"
      prefix.install_metafiles
    end
  end

  test do
    assert_equal "key: cat", shell_output("#{bin}/yq n key cat").chomp
    assert_equal "cat", pipe_output("#{bin}/yq r - key", "key: cat", 0).chomp
  end
end
