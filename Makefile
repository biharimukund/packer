.PHONY: all

coreos-vmware:
	packer build coreos-vmware.json
centos-vmware:
	packer build centos7-vmware.json
centos-vbox:
	packer build centos7-vbox.json
all: coreos-vmware 	centos-vmware
