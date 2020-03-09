
HOMEBREW := "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash)"


.PHONY: all
all: init_env

.PHONY: init_homebrew
init_homebrew:
	which brew || (echo "Install Brew" && /bin/bash -c $(HOMEBREW))

.PHONY: ansible
ansible: init_homebrew
	brew install ansible

.PHONY: init_env
init_env: ansible
	/usr/local/bin/ansible-playbook --connection=local --inventory 127.0.0.1 ./site.yml

.PHONY: kali_vbox
kali_vbox:
	VBoxManage list vms | egrep "Kali Linux" || VBoxManage import ~/iso/kali-linux-2020.1-vbox-amd64.ova --vsys 0 --vmname "Kali Linux" --eula accept

.PHONY: kali_start
kali_start: kali_vbox
	VBoxManage startvm "Kali Linux" --type gui


.PHONY: kali_poweroff
kali_poweroff:
	VBoxManage controlvm "Kali Linux" poweroff