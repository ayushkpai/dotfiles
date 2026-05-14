# dotfiles

## Mac setup

- Open Terminal App

  ```
  $ xcode-select --install
  ```

- Install Homebrew

  ```
  $ /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

- Install Firefox

  You can install firefox or use a different browser you prefer

  ```
  $ brew install --cask firefox
  ```

### Ghostty

- Install Ghostty

  ```
  $ brew install --cask ghostty
  ```

- Ghostty config

  ```
  $ mkdir ~/src
  $ cd ~/src
  $ git clone git@github.com:ayushkpai/dotfiles.git
  $ mkdir ~/.config
  $ ln -s ~/src/dotfiles/ghostty ~/.config/ghostty
  ```

### Git

- Install Git

  ```
  $ brew install git
  ```

- Git config

  ```
  $ git config --global user.name "Your name"
  $ git config --global user.email yourname@example.com
  $ git config --global core.autocrlf input
  $ git config --global core.editor "<Your editor> in my case 'code --wait' install visual studio code(shown below) if you want to use this"
  ```

- Install Visual Studio Code

  ```
  $ brew install --cask visual-studio-code
  ```

### Ruby and Rails

Install if you need

- Install Ruby

  ```
  $ brew install rbenv
  $ rbenv init
  ```

  Open a new terminal

  ```
  $ rbenv install 3.4.4
  $ rbenv global 3.4.4
  ```

- Install Rails

  ```
  $ gem install rails -v 8.0.2 --no-document
  ```
