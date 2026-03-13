# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
# Template file — CI replaces 0.2.0, 27ebce65fffe798f8839c6c17c35e2b69b507d07886c713b3f012563dfacad85,
# and b92025cd40cac9c08f87f100e44c382c0bf7cf4b5b9ead1b8bf2d3c85b2831fd before publishing to the tap.
class Marina < Formula
  desc "A dataset manager for robotics to organize, share, and discover datasets and metadata across storage backends."
  homepage "https://codeberg.org/stelzo/marina"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-arm64.tar.gz"
      sha256 "27ebce65fffe798f8839c6c17c35e2b69b507d07886c713b3f012563dfacad85"
    end

    on_intel do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-amd64.tar.gz"
      sha256 "b92025cd40cac9c08f87f100e44c382c0bf7cf4b5b9ead1b8bf2d3c85b2831fd"
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
