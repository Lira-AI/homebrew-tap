# typed: strict
# frozen_string_literal: true

# Lira AI terminal client.
class Lira < Formula
  desc "AI terminal client"
  homepage "https://lira-ai.com"
  version "0.10.1"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.lira-ai.com/download/tui/0.10.1/lira-0.10.1-aarch64-apple-darwin.zip"
      sha256 "6bf13dac3f20cb8c2752f91abf004e1d03a61e2d90be3cdac944d12c2ce478d4"
    end

    if Hardware::CPU.intel?
      url "https://api.lira-ai.com/download/tui/0.10.1/lira-0.10.1-x86_64-apple-darwin.zip"
      sha256 "02b82a15c2699c5a2d512d33a1eeaca0acb11ee1ce5a0110cd922b8b89517759"
    end
  end

  def install
    bin.install "lira"
  end

  test do
    assert_equal "lira #{version}", shell_output("#{bin}/lira --version").strip
  end
end
