# A few notes..

## Installing Neovim 0.12

Run the below to install Neovim 0.12. You can then run Neovim with `nvim`.


```bash
mkdir -p ~/apps/neovim-0.12
cd ~/apps/neovim-0.12

curl -LO https://github.com/neovim/neovim/releases/download/v0.12.0/nvim-linux-x86_64.tar.gz
tar xzf nvim-linux-x86_64.tar.gz

./nvim-linux-x86_64/bin/nvim --version

mkdir -p ~/.local/bin
ln -sf ~/apps/neovim-0.12/nvim-linux-x86_64/bin/nvim ~/.local/bin/nvim
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
nvim --version
```

## Installing tree-sitter

For appropriate syntax highlighting, you must install the tree-sitter-cli.

```bash
npm install -g tree-sitter-cli
```

Make sure you add it to your path:

```bash
echo 'export PATH="$HOME/.npm-global/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```
