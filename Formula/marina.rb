# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
# Template file — CI replaces 0.2.3, bc009ed38537197951e0323c865a81d9e9c99d6692e47f18a2ccecf404f5a384,
# and 7f0a49bd9bcc5d38a025c3eb7725646cc4d01063376e9522ff13a5b04e59db54 before publishing to the tap.
class Marina < Formula
  desc "A dataset manager for robotics to organize, share, and discover datasets and metadata across storage backends."
  homepage "https://codeberg.org/stelzo/marina"
  version "0.2.3"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-arm64.tar.gz"
      sha256 "bc009ed38537197951e0323c865a81d9e9c99d6692e47f18a2ccecf404f5a384"
    end

    on_intel do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-amd64.tar.gz"
      sha256 "7f0a49bd9bcc5d38a025c3eb7725646cc4d01063376e9522ff13a5b04e59db54"
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
