# dotfiles

You can install anything you want or skip it

## Mac setup

- Open Terminal App

  ```
  xcode-select --install
  ```

- Install Homebrew

  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

- Install Firefox

  ```
  brew install --cask firefox
  ```

- Install Tree Sitter

  ```
  brew install tree-sitter-cli
  ```

- Install RipGrep

  Fuzzy searching

  ```
  brew install ripgrep
  ```

- Create ssh key

  Do this only if you have a github account

  Follow the instructions in [Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Editors

- Visual Studio Code

  ```
  brew install --cask visual-studio-code
  ```

- Vim

  Vim comes built in in mac

  You can get it by running

  ```
  vim
  ```

- Neo Vim

  Neo vim is a better version of vim

  ```
  brew install neovim
  ```

  You can get it by typing

  ```
  nvim
  ```

### Ghostty

- Install Ghostty

  ```
  brew install --cask ghostty
  ```

- Ghostty config

  ```
  mkdir ~/src
  cd ~/src
  ```

  Make sure you have a ssh key

  ```
  git clone git@github.com:ayushkpai/dotfiles.git
  cd dotfiles
  mkdir ~/.config
  ln -s ~/src/dotfiles/ghostty ~/.config/ghostty
  ```

  if you don't have a github account

  ```
  mkdir dotfiles
  cd dotfiles
  mkdir ghostty
  cd ghostty
  echo maximize = true >> config
  echo copy-on-select = clipboard >> config
  mkdir ~/.config
  ln -s ~/src/dotfiles/ghostty ~/.config/ghostty
  ```

- Install oh my zsh

  Makes what you wright easier to read

  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

- Add Syntax highlighting

  Tells if what you type is valid

  ```
  brew install zsh-syntax-highlighting
  echo source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >> ~/.zshrc
  ```

- Add auto suggestions

  ```
  brew install zsh-autosuggestions
  echo source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh >> ~/.zshrc
  ```

- Add substring search

  This is a clean-room implementation of the [Fish shell](https://fishshell.com)'s history search
  feature, where you can type in any part of any command from history and then
  press chosen keys, such as the UP and DOWN arrows, to cycle through matches.

  ```
  brew install zsh-history-substring-search
  echo source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh >> ~/.zshrc
  ```

### Git

- Install Git

  There is a version in mac itself but we want to use the latest version

  ```
  brew install git
  ```

- Git config

  You need to do this step because these things will be used in your commits

  ```
  git config --global user.name "Your name"
  git config --global user.email yourname@example.com
  git config --global core.autocrlf input
  git config --global core.editor "Your editor"
  ```

### Ruby and Rails

- Install Ruby

  ```
  brew install rbenv
  rbenv init
  ```

  Open a new terminal

  ```
  rbenv install 3.4.4
  rbenv global 3.4.4
  ```

- Install Rails

  ```
  gem install rails -v 8.0.2 --no-document
  ```

### Node.js typescript and yarn

- Install Node.js and yarn

  ```
  brew install node yarn
  ```

- Typescript

  ```
  sudo npm i -g typescript
  ```

### Redis

- Install redis and start server

  ```
  brew install redis
  brew services restart redis
  ```

### Python

We are going to install python in uv

- Install python in uv

  ```
  brew install uv
  uv python install 3.14
  uv python pin 3.14
  ```

Now in any python project you need to

- Init and run

  ```
  uv init
  uv run python <Your project>
  ```

### Pygame zero

Make sure you have python installed

- Install python 3.13 cause pygame is not there in 3.14

  ```
  uv python install 3.13
  ```

In any project you need to

- Change files

  pyproject.toml - Add or replace this in the bottom

  ```
  requires-python = ">=3.13"
  dependencies = [
    "pgzero>=1.2.1",
    "pygame>=2.6.1",
  ]
  ```

  .python-version - Replace the verion line with

  ```
  3.13
  ```

- Add pygame

  ```
  uv add pygame
  uv add pgzero
  ```

### Mysql

- Install mysql and start

  ```
  brew install mysql
  brew services start mysql
  ```

### Data base(db)

- Install dbeaver

  A good tool for db

  ```
  brew install --cask dbeaver-community
  ```
