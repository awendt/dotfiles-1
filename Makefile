.PHONY: bundle stow

default: bundle stow /usr/local/lib/node_modules/coffee-script /usr/local/lib/node_modules/coffeelint

# Tasks

bundle: /usr/local/bin/brew
	brew bundle

stow: ~/.oh-my-zsh
	stow -R dotfiles

# Files

~/.oh-my-zsh:
	sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

/usr/local/bin/brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

/usr/local/lib/node_modules/coffee-script: bundle
	npm install -g coffee-script

/usr/local/lib/node_modules/coffeelint: bundle
	npm install -g coffeelint
