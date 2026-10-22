# Homebrew tap for Kilobyte

[Kilobyte](https://jgm240.github.io/kilobyte/), the text-mode desktop, on macOS:

```
brew trust jgm240/kilobyte
brew install --cask jgm240/kilobyte/kilobyte
```

(Homebrew installs from other people's taps only once you trust them: the
first line does that, once.)

That puts **Kilobyte.app** in Applications (it opens Kilobyte in a Terminal
window) and brings the `kb` command with it. Only the command, without the app:

```
brew install jgm240/kilobyte/kilobyte-transition
kb open
```

Kilobyte runs in a small Debian machine made with [Lima](https://lima-vm.io/)
(Apple's own virtualisation); the first `kb open` sets it up. `kb close`,
`kb autolaunch on|off`, `kb update` and `kb remove` do the rest.

The formula installs `kb` and the Lima template from
[jgm240/kilobyte](https://github.com/jgm240/kilobyte) (`macos/`). GNU GPL 3 or later.
