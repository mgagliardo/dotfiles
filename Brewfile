cask_args appdir: "/Applications"

# Tap
tap "caskroom/cask"
tap "homebrew/completions"

# Brew
brew "bash-completion"
brew "caskroom/cask/iterm2"
brew "wget"

# Cask
cask "google-chrome"
cask "atom"
cask "java" unless system "/usr/libexec/java_home --failfast"
cask "firefox", args: { appdir: "~/my-apps/Applications" }
cask "virtualbox"
cask "vagrant"
