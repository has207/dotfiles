all:
	for file in inputrc tmux.conf bashrc bash_aliases gitconfig python colordiffrc ctags; do \
		ln -sf dotfiles/$${file} ../.$${file}; \
	done
