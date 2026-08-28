# typed: strict
# frozen_string_literal: true

# Lira AI terminal client.
class Lira < Formula
  desc "AI terminal client"
  homepage "https://lira-ai.com"
  version "0.9.16"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.lira-ai.com/download/tui/0.9.16/lira-0.9.16-aarch64-apple-darwin.zip"
      sha256 "a4ca4e8117407e326f6de7f48d6042c62e77f9c50ffba856a3810bf859148d1f"
    end

    if Hardware::CPU.intel?
      url "https://api.lira-ai.com/download/tui/0.9.16/lira-0.9.16-x86_64-apple-darwin.zip"
      sha256 "b16c0a8829fc9cfae80a2b3fef026459d9b39be4efa5316a4128cac001aa53ac"
    end
  end

  def install
    bin.install "lira"
  end

  test do
    assert_equal "lira #{version}", shell_output("#{bin}/lira --version").strip
  end
end
