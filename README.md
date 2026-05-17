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

  You can install firefox or use a different browser you prefer

  ```
  brew install --cask firefox
  ```

- Install Visual Studio Code

  ```
  brew install --cask visual-studio-code
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

  if you have a github account and a ssh key run
  
  ```
  git clone git@github.com:ayushkpai/dotfiles.git
  ```

  if you don't have a ssh key follow the instructions in this [link](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

  then run

  ```
  git clone git@github.com:ayushkpai/dotfiles.git
  ```

  if you don't have a github account then just run

  ```
  mkdir dotfiles
  cd dotfiles
  mkdir ghostty
  cd ghostty
  echo maximize = true >> config
  echo copy-on-select = clipboard >> config
  ```

  after doing the following according to you then run

  ```
  mkdir ~/.config
  ln -s ~/src/dotfiles/ghostty ~/.config/ghostty
  ```

- Install oh my zsh

  You can install it if you want it makes what you wright easier to read

  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

- Add Syntax highlighting

  Install if you want tells if what you type is valid

  ```
  brew install zsh-syntax-highlighting
  echo source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >> ~/.zshrc
  ```

### Git

- Install Git

  There is a version in mac itself but we want to use the latest version

  ```
  brew install git
  ```

- Git config

  You need to do this step because these things will get used in your commits

  ```
  git config --global user.name "Your name"
  git config --global user.email yourname@example.com
  git config --global core.autocrlf input
  git config --global core.editor "<Your editor> in my case 'code --wait' install visual studio code (shown above) if you want to use this"
  ```

### Ruby and Rails

Install if you need

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
