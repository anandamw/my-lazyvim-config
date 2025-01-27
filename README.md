# 💤 LazyVim

**LazyVim** is a starter template for [LazyVim](https://github.com/LazyVim/LazyVim). To get started, refer to the [official LazyVim documentation](https://lazyvim.github.io/installation).

## Installation Steps

### 1. Backup Your Old Neovim Configuration (Optional)
If you want to back up your old Neovim configuration before replacing it with LazyVim, run the following commands to move it to a `.bak` folder.

#### On Linux:
```bash
# Move old configuration files to a backup directory
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# Clone LazyVim configuration
git clone https://github.com/anandamw/my-lazyvim-config/ ~/.config/nvim

# Remove Git history to avoid conflicts
rm -rf ~/.config/nvim/.git

# Open Neovim to finish the setup
nvim

# Install Blade Formatter globally
npm install -g blade-formatter
```

#### On Windows:
```bash
# Move old configuration files to a backup directory
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.bak

# Optional but recommended: Backup Neovim data
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.bak

# Clone LazyVim configuration
git clone https://github.com/anandamw/my-lazyvim-config/ $env:LOCALAPPDATA\nvim

# Remove Git history to avoid conflicts
Remove-Item $env:LOCALAPPDATA\nvim\.git -Recurse -Force

# Open Neovim to finish the setup
nvim

# Install Blade Formatter globally
npm install -g blade-formatter
```
