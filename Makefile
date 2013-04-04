all:
	for file in tmux.conf bashrc bash_aliases gitconfig python colordiffrc; do \
		ln -sf dotfiles/$${file} ../.$${file}; \
	done
	test uname = Darwin && ln -sf dotfiles/inputrc ../.inputrc || echo
