# Minimal Neovim Config

Uses [coc](https://github.com/neoclide/coc.nvim/wiki/Language-servers) for LSP.

```bash
# Install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Clone config
mkdir -p ~/.config
git clone https://github.com/pheuter/nvim-init.git ~/.config/nvim

# Install plugins
nvim
:PlugInstall
```
