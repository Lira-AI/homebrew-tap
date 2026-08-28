# typed: strict
# frozen_string_literal: true

# Lira AI terminal client.
class Lira < Formula
  desc "AI terminal client"
  homepage "https://lira-ai.com"
  version "0.9.15"

  depends_on :macos

  on_macos do
    if Hardware::CPU.arm?
      url "https://api.lira-ai.com/download/tui/0.9.15/lira-0.9.15-aarch64-apple-darwin.zip"
      sha256 "9e8e0d164aaa89b50cf97cce13d74d37e031962c91eaad3c56a0442a63dbd7d5"
    end

    if Hardware::CPU.intel?
      url "https://api.lira-ai.com/download/tui/0.9.15/lira-0.9.15-x86_64-apple-darwin.zip"
      sha256 "6593a0bf555f8306233a567e3164aa88ecd4e7a8f819b19b71e06ca43280db63"
    end
  end

  def install
    bin.install "lira"
  end

  test do
    assert_equal "lira #{version}", shell_output("#{bin}/lira --version").strip
  end
end
