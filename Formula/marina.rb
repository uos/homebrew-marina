# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
# Template file — CI replaces 0.1.0, 9f91a3c66424c5b74566106cf65ce78154451e58349485b1e0b01a8e5df51a98,
# and 71b09ff8b0e09ed71b85133cef7b657caeddecbab840d545a304b0b1bd3901fb before publishing to the tap.
class Marina < Formula
  desc "A dataset manager for robotics to organize, share, and discover datasets and metadata across storage backends."
  homepage "https://codeberg.org/stelzo/marina"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-arm64.tar.gz"
      sha256 "9f91a3c66424c5b74566106cf65ce78154451e58349485b1e0b01a8e5df51a98"
    end

    on_intel do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-amd64.tar.gz"
      sha256 "71b09ff8b0e09ed71b85133cef7b657caeddecbab840d545a304b0b1bd3901fb"
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
