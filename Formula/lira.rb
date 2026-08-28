# typed: strict
# frozen_string_literal: true

# Lira AI terminal client.
class Lira < Formula
  desc "AI terminal client"
  homepage "https://lira-ai.com"
  version "0.9.13"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.lira-ai.com/download/tui/0.9.13/lira-0.9.13-aarch64-apple-darwin.zip"
      sha256 "a8e740beb67e28d595d11d50d869b2b2d0db05f9ee6930917ade62a480c08a56"
    end

    if Hardware::CPU.intel?
      url "https://api.lira-ai.com/download/tui/0.9.13/lira-0.9.13-x86_64-apple-darwin.zip"
      sha256 "940cf1786c0ebf2cb4cac933aed6671baec9cd782494bf6069e8038896c071b6"
    end
  end

  def install
    bin.install "lira"
  end

  test do
    assert_equal "lira #{version}", shell_output("#{bin}/lira --version").strip
  end
end
