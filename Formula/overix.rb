class Overix < Formula
  desc "YAML-based lightweight configuration management CLI"
  homepage "https://github.com/inamuu/overix"
  url "https://github.com/inamuu/overix/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "eedb4a93b03671811fd8c427ec1a3ad31fed226ae8db1944d077acbd3cd6de9f"

  depends_on "go" => :build

  def install
    ENV["CGO_ENABLED"] = "0"
    ldflags = "-s -w -X github.com/inamuu/overix/internal/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "-mod=vendor", "./cmd/overix"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/overix version")
  end
end
