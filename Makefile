
HOMEBREW := "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash)"

init_homebrew:
	which brew || (echo "Install Brew" && /bin/bash -c $(HOMEBREW))

ansible: init_homebrew
	brew install ansible

init_env: ansible
	/usr/local/bin/ansible-playbook --connection=local --inventory 127.0.0.1 ./site.yml

*: init_env