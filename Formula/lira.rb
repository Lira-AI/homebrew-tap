# typed: strict
# frozen_string_literal: true

# Lira AI terminal client.
class Lira < Formula
  desc "AI terminal client"
  homepage "https://lira-ai.com"
  version "0.9.12"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.lira-ai.com/download/tui/0.9.12/lira-0.9.12-aarch64-apple-darwin.zip"
      sha256 "bd3000d3920b0d88601e01393f8302a950b34b225006d68377c0ab164087dd60"
    end

    if Hardware::CPU.intel?
      url "https://api.lira-ai.com/download/tui/0.9.12/lira-0.9.12-x86_64-apple-darwin.zip"
      sha256 "9aff5c292eb1bf4f3e4241b111271b620c8b0f1f133a3947f7bed809a2a9fc26"
    end
  end

  def install
    bin.install "lira"
  end

  test do
    assert_equal "lira #{version}", shell_output("#{bin}/lira --version").strip
  end
end
