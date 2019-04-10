#!/usr/bin/env bash

brew update
brew upgrade

brew install ansible docker-credential-helper-ecr	docker-machine-parallels	openssl \
ansible-cmdb			docker-gen			docker-squash			python \
ansible-lint			docker-ls			docker-swarm			python@2 \
docker				docker-machine			docker2aci			readline \
docker-clean			docker-machine-driver-hyperkit	dockerize			sqlite \
docker-cloud			docker-machine-driver-vultr	gdbm				xz \
docker-compose			docker-machine-driver-xhyve	kubernetes-cli \
docker-credential-helper	docker-machine-nfs		libyaml

pip install --upgrade pip setuptools

sudo chown root:wheel /usr/local/opt/docker-machine-driver-hyperkit/bin/docker-machine-driver-hyperkit
sudo chmod u+s /usr/local/opt/docker-machine-driver-hyperkit/bin/docker-machine-driver-hyperkit

sudo chown root:wheel /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve
sudo chmod u+s /usr/local/opt/docker-machine-driver-xhyve/bin/docker-machine-driver-xhyve

# minikube start --logtostderr --vm-driver=xhyve