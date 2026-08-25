### Prerequisites:
- zsh must be installed
- ~/.gitconfig.local with Git identity
```
[user]
    name = Moka Amayui
    email = amayui_moka@vspo.com
```
- Language servers must be installed for vim-lsp to work (e.g. `clangd` for C/C++)

### Usage
- Run `bootstrap.sh`. This clones/downloads necessary dependencies outside the ones highlighted above in the `Prerequisites` section.
- Run `install.sh` this replaces the various dotfiles in your system with the ones in this repository.
