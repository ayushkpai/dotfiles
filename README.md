# dotfiles

## Required

- xcode `xcode-select --install`
- Homebrew `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

---

## Recomended

- Firefox `brew install --cask firefox`
- RipGrep `brew install ripgrep`
- Github ssh key. Follow the instructions in [Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)

### Visual Studio Code

- vscode `brew install --cask visual-studio-code`
- vscode recomended extensions
  - [Ayush Pai Theme](https://github.com/ayushkpai/ayush-pai-theme)
  - C/C++
  - Gitlens
  - JavaScript and TypeScript nightly
  - Prettier
  - Prisma
  - Pylance
  - Python
  - Python debugger
  - Python envoirments
  - Ruby lsp
  - Tailwind css intellisense
  - vscode icons

### Ghostty

- Ghostty `brew install --cask ghostty`
- Ghostty config

  ```
  git clone git@github.com:ayushkpai/dotfiles.git ~/src/dotfiles
  mkdir ~/.config
  ln -s ~/src/dotfiles/ghostty ~/.config/ghostty
  ```

- oh my zsh `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- Syntax highlighting

  ```
  brew install zsh-syntax-highlighting
  echo source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh >> ~/.zshrc
  ```

- Auto suggestions

  ```
  brew install zsh-autosuggestions
  echo source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh >> ~/.zshrc
  ```

- Substring search

  ```
  brew install zsh-history-substring-search
  echo source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh >> ~/.zshrc
  ```

- Bat `brew install bat`

### Neo Vim

- Neo Vim `brew install neovim`
- Neo Vim config
  - Tree Sitter `brew install tree-sitter-cli`

  ```
  git clone git@github.com:ayushkpai/dotfiles.git ~/src/dotfiles
  ln -s ~/src/dotfiles/nvim ~/.config/nvim
  ```

### Git

- Git `brew install git`
- Git config

  ```
  git config --global user.name "Your name"
  git config --global user.email "yourname@example.com"
  git config --global core.autocrlf input
  git config --global core.editor "Your editor"
  ```

---

- Ruby

  ```
  brew install rbenv
  rbenv init
  ```

  Open a new terminal

  ```
  rbenv install 3.4.4
  rbenv global 3.4.4
  ```

- Rails `gem install rails -v 8.0.2 --no-document`
- Node.js `brew install node`
- Yarn `brew install yarn`
- Typescript compiler `sudo npm i -g typescript`
- dbeaver `brew install --cask dbeaver-community`
- Redis

  ```
  brew install redis
  brew services restart redis
  ```

- Mysql

  ```
  brew install mysql
  brew services start mysql
  ```

- Create vscode extension
  - vscode extension generator `npm install -g yo generator-code`
  - vscode extension packager `npm install -g vsce`
  - Create extension `yo code`
  - Package `vsce package`

### Python

- Python

  ```
  brew install uv
  uv python install 3.14
  uv python pin 3.14
  ```

- Python package
  - Add to pyproject.toml

    ```
    [project.scripts]
    <your_command> = "<your_command>.code:main"
    ```

  - Add to end of your code and main.py

    ```
    if __name__ == "__main__":
      main()
    ```

  - Project structure

    src/<your_command>/code.py

  - Package it

    ```
    uv tool install .
    uv pip install -e .
    ```

### Pygame

- Python 3.13 `uv python install 3.13`
- pyproject.toml

  ```
  requires-python = ">=3.13"
  ```

- .python-version

  ```
  3.13
  ```

- Add pygame

  ```
  uv add pygame
  uv add pgzero
  ```
