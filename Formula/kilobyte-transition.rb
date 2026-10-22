class KilobyteTransition < Formula
  desc "Kilobyte, the text-mode desktop, on macOS (in a small Lima machine)"
  homepage "https://jgm240.github.io/kilobyte/"
  url "https://github.com/jgm240/kilobyte/archive/refs/tags/macos-v1.5.2.tar.gz"
  sha256 "6a622ea7213013bd3fd062abbc24d86c1e93b09514222b026087101668a376af"
  license "GPL-3.0-or-later"

  depends_on "lima"
  depends_on :macos

  def install
    bin.install "macos/kb"
    pkgshare.install "macos/kilobyte.yaml"
  end

  def caveats
    <<~EOS
      Kilobyte runs in a small Debian machine made with Lima.
      The first `kb open` sets it up: Debian and Kilobyte download once
      (about 1 GB), which takes a few minutes. Then:
        kb open             go to Kilobyte
        kb close            stop Kilobyte's machine
        kb autolaunch on    open Kilobyte in Terminal when you log in
        kb remove           remove Kilobyte's machine
    EOS
  end

  test do
    assert_match "kb open", shell_output("#{bin}/kb help")
    assert_path_exists pkgshare/"kilobyte.yaml"
  end
end
