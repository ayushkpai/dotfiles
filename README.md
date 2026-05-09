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

  ```
  $ brew install --cask firefox
  ```

- Install Ghostty

  ```
  $ brew install --cask ghostty
  ```

- Auto hide dock

  Open Settings > "Desktop & Dock" > "Enable Auto hide"

- Install Git

  ```
  $ brew install git
  ```

## For Ruby on Rails

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

- Git config

  ```
  git config --global user.name "Your name"
  git config --global user.email yourname@example.com
  git config --global core.autocrlf input
  ```
