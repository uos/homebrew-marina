# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
# Template file — CI replaces 0.2.0, 11bdc4449328140790e6cf0e65e3f6f3ae06c71dbd5623dec2472f577c52401c,
# and 779ed7e6761dfb816ff985ed452c071a9d395e80bb891fd43920a23af7cdf174 before publishing to the tap.
class Marina < Formula
  desc "A dataset manager for robotics to organize, share, and discover datasets and metadata across storage backends."
  homepage "https://codeberg.org/stelzo/marina"
  version "0.2.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-arm64.tar.gz"
      sha256 "11bdc4449328140790e6cf0e65e3f6f3ae06c71dbd5623dec2472f577c52401c"
    end

    on_intel do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-amd64.tar.gz"
      sha256 "779ed7e6761dfb816ff985ed452c071a9d395e80bb891fd43920a23af7cdf174"
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
