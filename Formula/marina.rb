# Maintainer: Christopher Sieh (stelzo) <stelzo@steado.de>
# Template file — CI replaces 0.1.0, 728fd3e5d79b54f9c113f818dcf35eae7ff6d39634cc9bc4a2f4539a35fd6058,
# and 726cb33ec670ddc06369e390627623098a1073e2ec2e4121122a8acde5b0ea0c before publishing to the tap.
class Marina < Formula
  desc "A dataset manager for robotics to organize, share, and discover datasets and metadata across storage backends."
  homepage "https://codeberg.org/stelzo/marina"
  version "0.1.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-arm64.tar.gz"
      sha256 "728fd3e5d79b54f9c113f818dcf35eae7ff6d39634cc9bc4a2f4539a35fd6058"
    end

    on_intel do
      url "https://uos-robotics.codeberg.page/ppa/bin/marina-#{version}-macos-amd64.tar.gz"
      sha256 "726cb33ec670ddc06369e390627623098a1073e2ec2e4121122a8acde5b0ea0c"
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
