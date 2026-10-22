cask "kilobyte" do
  version "1.5.2"
  sha256 "6a622ea7213013bd3fd062abbc24d86c1e93b09514222b026087101668a376af"

  url "https://github.com/jgm240/kilobyte/archive/refs/tags/macos-v#{version}.tar.gz"
  name "Kilobyte"
  desc "Text-mode desktop, run in a small Lima machine"
  homepage "https://jgm240.github.io/kilobyte/"

  depends_on formula: "jgm240/kilobyte/kilobyte-transition"
  depends_on macos: :monterey

  app "kilobyte-macos-v#{version}/macos/Kilobyte.app"

  zap trash: "~/Library/LaunchAgents/io.github.jgm240.kilobyte.plist"

  caveats <<~EOS
    Open Kilobyte from Applications (or type kb open in a terminal). The first
    time it sets up Kilobyte's machine: Debian and Kilobyte download once
    (about 1 GB), which takes a few minutes. macOS asks once whether Kilobyte
    may control Terminal: allow it.

    Kilobyte.app is not signed with an Apple developer account, so the first
    time macOS will not open it: open System Settings > Privacy & Security
    and click "Open Anyway" next to Kilobyte (once).
  EOS
end
