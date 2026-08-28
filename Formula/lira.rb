# typed: strict
# frozen_string_literal: true

# Lira AI terminal client.
class Lira < Formula
  desc "AI terminal client"
  homepage "https://lira-ai.com"
  version "0.9.14"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.lira-ai.com/download/tui/0.9.14/lira-0.9.14-aarch64-apple-darwin.zip"
      sha256 "310c83fbbe00bf807426405e92d2cf04dc1214969e2adf60e015802892c245f2"
    end

    if Hardware::CPU.intel?
      url "https://api.lira-ai.com/download/tui/0.9.14/lira-0.9.14-x86_64-apple-darwin.zip"
      sha256 "27c23e6db4f3dc688452a754e02bedcc8170b7094ae61176ab1478075a7b232c"
    end
  end

  def install
    bin.install "lira"
  end

  test do
    assert_equal "lira #{version}", shell_output("#{bin}/lira --version").strip
  end
end
