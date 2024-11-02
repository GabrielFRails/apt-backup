-include .cache.mk

test:
	echo ${SSH_KEY_GEN_EMAIL} && \
	echo ${GIT_CONFIG_EMAIL} && \
	echo ${GIT_CONFIG_USER}

gen_sshkey:
	ssh-keygen -t ed25519 -C ${SSH_KEY_GEN_EMAIL} && \
	eval "$(ssh-agent -s)" && \
	ssh-add ~/.ssh/id_ed25519

touch_sshkey:
	cat ~/.ssh/id_ed25519.pub

set_git_global_config:
	git config --global user.name "${GIT_CONFIG_USER}"
	git config --global user.email ${GIT_CONFIG_EMAIL}

check_git_global_config:
	git config --list

all: gen_sshkey touch_sshkey