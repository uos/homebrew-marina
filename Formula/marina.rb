# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
# Template file — CI replaces 0.1.0, b0116bac583a840f4a6d363d73b3c645b1d32c033d4c896a52aa2d9bfa55f651,
# and 0ce501cb4f5148409d4582dcbec640fbe6573a849bef8dba22e23a575785afc6 before publishing to the tap.
class Marina < Formula
  desc "A dataset manager for robotics to organize, share, and discover datasets and metadata across storage backends."
  homepage "https://codeberg.org/stelzo/marina"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-arm64.tar.gz"
      sha256 "b0116bac583a840f4a6d363d73b3c645b1d32c033d4c896a52aa2d9bfa55f651"
    end

    on_intel do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-amd64.tar.gz"
      sha256 "0ce501cb4f5148409d4582dcbec640fbe6573a849bef8dba22e23a575785afc6"
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
