# dotfiles

- Configure here after installing in my [ignite](https://github.com/ayushkpai/ignite)

- vscode recomended extensions
  - [Ayush Pai Theme](https://github.com/ayushkpai/ayush-pai-theme)
  - C/C++
  - Gitlens
  - JavaScript and TypeScript nightly
  - Prettier
  - Prisma
  - Python
  - Ruby lsp
  - Tailwind css intellisense

- Ghostty config 
  
  ```
  ln -s ~/src/dotfiles/ghostty ~/.config/ghostty
  ```

- Oh My Zsh 
  
  ```
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  ```

- Zshrc 
  
  ```
  ln -s ~/src/dotfiles/zshrc ~/.zshrc
  ```

- Neo Vim config 
  
  ```
  ln -s ~/src/dotfiles/nvim ~/.config/nvim
  ```

- Git config

  ```
  git config --global user.name "Your name"
  git config --global user.email "yourname@example.com"
  git config --global core.autocrlf input
  ln -s ~/src/dotfiles/gitignore_global ~/.gitignore_global
  git config --global core.excludesfile ~/.gitignore_global
  ```

- Github ssh key. Follow the instructions in [Github](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent)
- Github Cli

  ```
  gh auth login
  gh config set editor "vim"
  ```

- Ruby

  ```
  rbenv init
  ```

  Open a new terminal

  ```
  rbenv install 4.0.6
  rbenv global 4.0.6
  ```

- Rails 
  
  ```
  gem install rails --no-document
  ```

- Typescript compiler 
  
  ```
  sudo npm i -g typescript
  ```

- Redis 

  ```
  brew services restart redis
  ```

- Mysql 
  
  ```
  brew services start mysql
  ```


- Python

  ```
  uv python install 3.14
  uv python install 3.13
  ```

- Arduino

  ```
  softwareupdate --install-rosetta
  ```

- Java

    ```
    brew install openjdk
    sudo ln -sfn /opt/homebrew/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk
    ```

## Bonus Section

- Create vscode extension
  - vscode extension generator 
  
    ```
    npm install -g yo generator-code
    ```
  - vscode extension packager 
    
    ```
    npm install -g vsce
    ```

  - Create extension 
    
    ```
    yo code
    ```

  - Package 
  
    ```
    vsce package
    ```

- Python package
  - pyproject.toml

    ```
    [project.scripts]
    <your_command> = "<your_command>.code:main"
    ```

  - code and main.py

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

- Pygame
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
