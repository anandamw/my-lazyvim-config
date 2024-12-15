# 💤 LazyVim

**LazyVim** is a starter template for [LazyVim](https://github.com/LazyVim/LazyVim). To get started, refer to the [official LazyVim documentation](https://lazyvim.github.io/installation).

## Installation Steps

### 1. Backup Your Old Neovim Configuration (Optional)
If you want to back up your old Neovim configuration before replacing it with LazyVim, run the following commands to move it to a `.bak` folder:

```bash
# Required
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/anandamw/my-lazyvim-config/ ~/.config/nvim


nvim
