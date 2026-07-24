# dotfiles

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

- Install RipGrep

  Fuzzy searching

  ```
  brew install ripgrep
  ```

- Create ssh key

  Do this only if you have a github account

  Follow the instructions in [Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Visual Studio Code

- Install vscode

  ```
  brew install --cask visual-studio-code
  ```

- Recomended extensions

  - [Ayush Pai Theme](https://github.com/ayushkpai/ayush-pai-theme)
  - C/C++
  - Gitlens
  - JavaScript and TypeScript nightly
  - Pylance
  - Python
  - Python debugger
  - Python envoirments
  - Ruby lsp
  - Tailwind css intellisense
  - vscode-icons

### Ghostty

- Install Ghostty

  ```
  brew install --cask ghostty
  ```

- Ghostty config

  ```
  cd ~/src
  ```

  If this gives a error run `mkdir ~/src`
  - Make sure you have a ssh key it saves passwprds so you don always have to put your github username and password

  ```
  git clone git@github.com:ayushkpai/dotfiles.git
  cd dotfiles
  mkdir ~/.config
  ln -s ~/src/dotfiles/ghostty ~/.config/ghostty
  ```

  if you don't have a github account use the https version

  ```
  git clone https://github.com/ayushkpai/dotfiles
  cd dotfiles
  mkdir ~/.config
  ln -s ~/src/dotfiles/ghostty ~/.config/ghostty
  ```

  Now you will get:
  - if you select something it will get copied
  - window is maximized
  - you have a black theme

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

### Neo Vim

Neo vim is a better version of vim

- Install Neo Vim

  ```
  brew install neovim
  ```

- You can open it by typing

  ```
  nvim
  ```

- Neo Vim config

  - Install Tree Sitter

    ```
    brew install tree-sitter-cli
    ```

  ```
  cd ~/src
  ```

  If this gives a error run `mkdir ~/src`
  - Make sure you have a ssh key it saves passwprds so you don always have to put your github username and password

  ```
  git clone git@github.com:ayushkpai/dotfiles.git
  cd dotfiles
  ln -s ~/src/dotfiles/nvim ~/.config/nvim
  ```
  If you get a error in the above or below command run `mkdir ~/.config`
  if you don't have a github account use the https version

  ```
  git clone https://github.com/ayushkpai/dotfiles
  cd dotfiles
  ln -s ~/src/dotfiles/nvim ~/.config/nvim
  ```

  Now you will get:
  - Your nvim theme

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
  git config --global user.email "yourname@example.com"
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
