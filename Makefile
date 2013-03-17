all:
	ln -sf dotfiles/tmux.conf ../.tmux.conf
	ln -sf dotfiles/bashrc ../.bashrc
	ln -sf dotfiles/gitconfig ../.gitconfig
	ln -sf dotfiles/python ../.python
	test uname = Darwin && ln -sf dotfiles/inputrc ../.inputrc || echo
