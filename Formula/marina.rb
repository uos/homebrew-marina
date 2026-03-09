# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
# Template file — CI replaces 0.1.0, 73eccd63d33aca38bd3e3d626cbd5bcd5e2f32ad6d83d155765a7f0ce951a144,
# and 7977afb7b013c6d20588ad18df0dee5edaebf38b1d0c2629d865cc0ac5c5639e before publishing to the tap.
class Marina < Formula
  desc "A dataset manager for robotics to organize, share, and discover datasets and metadata across storage backends."
  homepage "https://codeberg.org/stelzo/marina"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-arm64.tar.gz"
      sha256 "73eccd63d33aca38bd3e3d626cbd5bcd5e2f32ad6d83d155765a7f0ce951a144"
    end

    on_intel do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-amd64.tar.gz"
      sha256 "7977afb7b013c6d20588ad18df0dee5edaebf38b1d0c2629d865cc0ac5c5639e"
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
