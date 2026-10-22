cask "kilobyte" do
  version "1.5.1"
  sha256 "cd14bb483a46b08494500859fcbdb152e462448e28f4ccdde9ecfae312ed3ce1"

  url "https://github.com/jgm240/kilobyte/archive/refs/tags/macos-v#{version}.tar.gz"
  name "Kilobyte"
  desc "Text-mode desktop, run in a small Lima machine"
  homepage "https://jgm240.github.io/kilobyte/"

  depends_on formula: "jgm240/kilobyte/kilobyte-transition"
  depends_on macos: ">= :monterey"

  app "kilobyte-macos-v#{version}/macos/Kilobyte.app"

  # Kilobyte.app is a small shell script, not signed by an Apple developer
  # account: without this, macOS would refuse to open it until it is allowed
  # in System Settings > Privacy & Security.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Kilobyte.app"]
  end

  zap trash: "~/Library/LaunchAgents/io.github.jgm240.kilobyte.plist"

  caveats <<~EOS
    Open Kilobyte from Applications (or type kb open in a terminal). The first
    time it sets up Kilobyte's machine: Debian and Kilobyte download once
    (about 1 GB), which takes a few minutes. macOS asks once whether Kilobyte
    may control Terminal: allow it.
  EOS
end
