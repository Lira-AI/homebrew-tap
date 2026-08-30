# typed: strict
# frozen_string_literal: true

# Lira AI terminal client.
class Lira < Formula
  desc "AI terminal client"
  homepage "https://lira-ai.com"
  version "0.10.0"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.lira-ai.com/download/tui/0.10.0/lira-0.10.0-aarch64-apple-darwin.zip"
      sha256 "0805c0d3263ce4c815111348a558dda58c31a98537c8c92980bb92040abc378a"
    end

    if Hardware::CPU.intel?
      url "https://api.lira-ai.com/download/tui/0.10.0/lira-0.10.0-x86_64-apple-darwin.zip"
      sha256 "4de7e3d3ff0b113c0360f4c6102029cdf40b35b9437fed4602353be9f817fe5b"
    end
  end

  def install
    bin.install "lira"
  end

  test do
    assert_equal "lira #{version}", shell_output("#{bin}/lira --version").strip
  end
end
