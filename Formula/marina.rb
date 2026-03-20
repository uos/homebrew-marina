# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
# Template file — CI replaces 0.2.2, fdfabd2b73309227207e94f54790d21a3653150c6c2a13259c0bd0bc591e4f9a,
# and 8d16186ca7fd912056223de7eb6d50ece39b125ee680e68a623ce38915edb07c before publishing to the tap.
class Marina < Formula
  desc "A dataset manager for robotics to organize, share, and discover datasets and metadata across storage backends."
  homepage "https://codeberg.org/stelzo/marina"
  version "0.2.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-arm64.tar.gz"
      sha256 "fdfabd2b73309227207e94f54790d21a3653150c6c2a13259c0bd0bc591e4f9a"
    end

    on_intel do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-amd64.tar.gz"
      sha256 "8d16186ca7fd912056223de7eb6d50ece39b125ee680e68a623ce38915edb07c"
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
