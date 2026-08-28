# typed: strict
# frozen_string_literal: true

# Lira AI terminal client.
class Lira < Formula
  desc "AI terminal client"
  homepage "https://lira-ai.com"
  version "0.9.17"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.lira-ai.com/download/tui/0.9.17/lira-0.9.17-aarch64-apple-darwin.zip"
      sha256 "584d3cb20d5d4398df636ac48d5d2c9948a91b64c844ac3b87d16af34f143b4b"
    end

    if Hardware::CPU.intel?
      url "https://api.lira-ai.com/download/tui/0.9.17/lira-0.9.17-x86_64-apple-darwin.zip"
      sha256 "760c88f6d586721457f263adcf6d9cdfb72547928a90a9b253c10ba96830c382"
    end
  end

  def install
    bin.install "lira"
  end

  test do
    assert_equal "lira #{version}", shell_output("#{bin}/lira --version").strip
  end
end
