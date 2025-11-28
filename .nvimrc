" Keep Neovim legacy config in sync
if filereadable(expand('~/.vimrc'))
  source ~/.vimrc
endif
