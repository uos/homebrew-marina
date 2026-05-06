# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
# Template file — CI replaces 0.2.6 and 0d4af7df8f6e87a270243db8298416ddfd85132b5a15298ce283dc7bf4793e8d
# before publishing to the tap.
class Marina < Formula
  desc "A dataset manager for robotics to organize, share, and discover datasets and metadata across storage backends."
  homepage "https://codeberg.org/stelzo/marina"
  version "0.2.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-arm64.tar.gz"
      sha256 "0d4af7df8f6e87a270243db8298416ddfd85132b5a15298ce283dc7bf4793e8d"
    end
  end

  def install
    chmod 0755, "marina"
    bin.install "marina"

    generate_completions_from_executable(bin/"marina", "completions")
  end

  test do
    system "#{bin}/marina", "--version"
  end
end
