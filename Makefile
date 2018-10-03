
all:
	ln -s $(CURDIR)/zshrc ~/.zshrc
	ln -s $(CURDIR)/env ~/.env
	ln -s $(CURDIR)/vimrc ~/.vimrc
	ln -s $(CURDIR)/gitconfig ~/.gitconfig
	ln -s $(CURDIR)/tmux.conf ~/.tmux.conf
	ln -s $(CURDIR)/aliases ~/.aliases
	ln -s $(CURDIR)/Xresources ~/.Xresources
	ln -s $(CURDIR)/i3 ~/.i3
	ln -s $(CURDIR)/dunstrc ~/.config/dunst/dunstrc


clean:
	rm -rf ~/.zshrc
	rm -rf ~/.env
	rm -rf ~/.vimrc
	rm -rf ~/.gitconfig
	rm -rf ~/.tmux.conf
	rm -rf ~/.aliases
	rm -rf ~/.Xresources
	rm -rf ~/.i3
	rm -rf ~/.config/dunst/dunstrc
