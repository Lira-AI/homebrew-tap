# typed: strict
# frozen_string_literal: true

# Lira AI terminal client.
class Lira < Formula
  desc "AI terminal client"
  homepage "https://lira-ai.com"
  version "0.10.2"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.lira-ai.com/download/tui/0.10.2/lira-0.10.2-aarch64-apple-darwin.zip"
      sha256 "86d5e29352eab6359db51338f710ab98d8824494c3bd65c0c24bbebecbf8da04"
    end

    if Hardware::CPU.intel?
      url "https://api.lira-ai.com/download/tui/0.10.2/lira-0.10.2-x86_64-apple-darwin.zip"
      sha256 "d01ac4877ea37fb5bdba251fd858d4ff8278deb3fdc725f8a04e9fc4d9051e08"
    end
  end

  def install
    bin.install "lira"
  end

  test do
    assert_equal "lira #{version}", shell_output("#{bin}/lira --version").strip
  end
end
