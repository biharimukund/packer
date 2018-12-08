# packer

This repo can be used to create images for VMs using packer on Virtual Box or ESXi.

## Steps for Virtual Box

* You need go have virtual Box installed on your local machine.
* It should be net adapters so that internet is accessible( most of the times this does not works)

### centos7-vbox.json can be used to commision a Centos VM tempalte for Virtual Box.

**Command: packer build centos7-vbox.json**

```
Sample Output for Virtual box:
=====================================================================

virtualbox-iso output will be in this color.

==> virtualbox-iso: Retrieving Guest additions
    virtualbox-iso: Using file in-place: file:///Applications/VirtualBox.app/Contents/MacOS/VBoxGuestAdditions.iso
==> virtualbox-iso: Retrieving ISO
    virtualbox-iso: Found already downloaded, initial checksum matched, no download needed: http://centos.mirroring.pulsant.co.uk/7/isos/x86_64/CentOS-7-x86_64-Minimal-1804.iso
==> virtualbox-iso: Starting HTTP server on port 8419
==> virtualbox-iso: Creating virtual machine...
==> virtualbox-iso: Creating hard drive...
==> virtualbox-iso: Creating forwarded port mapping for communicator (SSH, WinRM, etc) (host port 4316)
==> virtualbox-iso: Starting the virtual machine...
    virtualbox-iso: The VM will be run headless, without a GUI. If you want to
    virtualbox-iso: view the screen of the VM, connect via VRDP without a password to
    virtualbox-iso: rdp://127.0.0.1:5918
==> virtualbox-iso: Waiting 10s for boot...
==> virtualbox-iso: Typing the boot command...
==> virtualbox-iso: Using ssh communicator to connect: 127.0.0.1
==> virtualbox-iso: Waiting for SSH to become available...
==> virtualbox-iso: Connected to SSH!
==> virtualbox-iso: Uploading VirtualBox version info (5.2.16)
==> virtualbox-iso: Uploading VirtualBox guest additions ISO...
==> virtualbox-iso: Provisioning with shell script: scripts/zerodisk.sh
==> virtualbox-iso: Gracefully halting virtual machine...
==> virtualbox-iso: Preparing to export machine...
    virtualbox-iso: Deleting forwarded port mapping for the communicator (SSH, WinRM, etc) (host port 4316)
==> virtualbox-iso: Exporting virtual machine...
    virtualbox-iso: Executing: export packer-virtualbox-iso-1543686774 --output output-virtualbox-iso/packer-virtualbox-iso-1543686774.ovf
==> virtualbox-iso: Deregistering and deleting VM...
Build 'virtualbox-iso' finished.

=====================================================================

Below files are generated in the root dir from where the command is run:

mukund_bihari$ cd output-virtualbox-iso/
output-virtualbox-iso mukund_bihari$ ll
total 1442768
-rwx------  1 mukund mukund       6647 Dec  1 23:28 packer-virtualbox-iso-1543686774.ovf
-rw-r--r--  1 mukund mukund  732568064 Dec  1 23:28 packer-virtualbox-iso-1543686774-disk001.vmdk

```

## Steps for ESXi

### centos7-vmware.json can be used to commision a Centos VM tempalte on ESXi.

_You can set ESXi on you local machine by downloading the VMware-VMvisor-Installer-6.7.0-8169922.x86_64.iso available on VMware official website. Trail copy has vailidity of 60 days. After it expires, simply uninstall it and resinstall to use it for next 60 days. Do not forget to take backup while uninstalling so that all of your machines data is intact which can be re-used for next installation._

You need to enable SSH in you ESXI host so that pakcer can connect to it. If you are using Mac, then you need to install VMware Fusion which will run the ESXi on your local machine.

Steps to enable SSH on ESXi:

* Login to ESXi using the URL and traverse to host >> Manage >> services >> Select TSM-SSH and start.

    e.g URL : https://192.168.200.130/ui/#/host/manage/services

* Firewall needs to be disabled so that port 22 is open for packer incoming traffic in ESXi.
    * Command:   
        * esxcli network firewall get
        * esxcli network firewall unload        

After these steps you can run the packet to build VMs in ESXi using below command:

**packer build centos7-vmware.json**

Sample Output for vmware-iso:


![Alt text](img/vmware_iso_output.jpeg?raw=true "vmware_iso_output")

## Steps for Coresos on ESXi:

**Command: PACKER_LOG=1 packer build coreos-vmware.json**

If  you do not want to run in debug mode, simply run withou *PACKER_LOG=1*

Sample O/P run in debig mode:

```
2018/12/08 18:16:14 Packer Target OS/Arch: darwin amd64
2018/12/08 18:16:14 Built with Go Version: go1.11.1
2018/12/08 18:16:14 Detected home directory from env var: /Users/mukund_bihari
2018/12/08 18:16:14 Using internal plugin for cloudstack
2018/12/08 18:16:14 Using internal plugin for vmware-vmx
2018/12/08 18:16:14 Using internal plugin for hyperv-iso
2018/12/08 18:16:14 Using internal plugin for lxc
2018/12/08 18:16:14 Using internal plugin for null
2018/12/08 18:16:14 Using internal plugin for openstack
2018/12/08 18:16:14 Using internal plugin for amazon-ebs
2018/12/08 18:16:14 Using internal plugin for amazon-ebssurrogate
2018/12/08 18:16:14 Using internal plugin for amazon-ebsvolume
2018/12/08 18:16:14 Using internal plugin for docker
2018/12/08 18:16:14 Using internal plugin for oracle-oci
2018/12/08 18:16:14 Using internal plugin for scaleway
2018/12/08 18:16:14 Using internal plugin for vmware-iso
2018/12/08 18:16:14 Using internal plugin for googlecompute
2018/12/08 18:16:14 Using internal plugin for parallels-pvm
2018/12/08 18:16:14 Using internal plugin for alicloud-ecs
2018/12/08 18:16:14 Using internal plugin for ncloud
2018/12/08 18:16:14 Using internal plugin for triton
2018/12/08 18:16:14 Using internal plugin for amazon-chroot
2018/12/08 18:16:14 Using internal plugin for amazon-instance
2018/12/08 18:16:14 Using internal plugin for lxd
2018/12/08 18:16:14 Using internal plugin for oracle-classic
2018/12/08 18:16:14 Using internal plugin for hyperv-vmcx
2018/12/08 18:16:14 Using internal plugin for oneandone
2018/12/08 18:16:14 Using internal plugin for profitbricks
2018/12/08 18:16:14 Using internal plugin for digitalocean
2018/12/08 18:16:14 Using internal plugin for file
2018/12/08 18:16:14 Using internal plugin for qemu
2018/12/08 18:16:14 Using internal plugin for virtualbox-iso
2018/12/08 18:16:14 Using internal plugin for azure-arm
2018/12/08 18:16:14 Using internal plugin for hcloud
2018/12/08 18:16:14 Using internal plugin for parallels-iso
2018/12/08 18:16:14 Using internal plugin for virtualbox-ovf
2018/12/08 18:16:14 Using internal plugin for chef-solo
2018/12/08 18:16:14 Using internal plugin for converge
2018/12/08 18:16:14 Using internal plugin for chef-client
2018/12/08 18:16:14 Using internal plugin for shell-local
2018/12/08 18:16:14 Using internal plugin for windows-restart
2018/12/08 18:16:14 Using internal plugin for windows-shell
2018/12/08 18:16:14 Using internal plugin for ansible
2018/12/08 18:16:14 Using internal plugin for puppet-masterless
2018/12/08 18:16:14 Using internal plugin for puppet-server
2018/12/08 18:16:14 Using internal plugin for salt-masterless
2018/12/08 18:16:14 Using internal plugin for ansible-local
2018/12/08 18:16:14 Using internal plugin for file
2018/12/08 18:16:14 Using internal plugin for powershell
2018/12/08 18:16:14 Using internal plugin for shell
2018/12/08 18:16:14 Using internal plugin for compress
2018/12/08 18:16:14 Using internal plugin for googlecompute-export
2018/12/08 18:16:14 Using internal plugin for googlecompute-import
2018/12/08 18:16:14 Using internal plugin for vsphere
2018/12/08 18:16:14 Using internal plugin for vsphere-template
2018/12/08 18:16:14 Using internal plugin for alicloud-import
2018/12/08 18:16:14 Using internal plugin for docker-push
2018/12/08 18:16:14 Using internal plugin for docker-save
2018/12/08 18:16:14 Using internal plugin for manifest
2018/12/08 18:16:14 Using internal plugin for artifice
2018/12/08 18:16:14 Using internal plugin for checksum
2018/12/08 18:16:14 Using internal plugin for shell-local
2018/12/08 18:16:14 Using internal plugin for vagrant-cloud
2018/12/08 18:16:14 Using internal plugin for amazon-import
2018/12/08 18:16:14 Using internal plugin for docker-import
2018/12/08 18:16:14 Using internal plugin for docker-tag
2018/12/08 18:16:14 Using internal plugin for vagrant
2018/12/08 18:16:14 Detected home directory from env var: /Users/mukund_bihari
2018/12/08 18:16:14 Attempting to open config file: /Users/mukund_bihari/.packerconfig
2018/12/08 18:16:14 [WARN] Config file doesn't exist: /Users/mukund_bihari/.packerconfig
2018/12/08 18:16:14 Packer config: &{DisableCheckpoint:false DisableCheckpointSignature:false PluginMinPort:10000 PluginMaxPort:25000 Builders:map[amazon-ebsvolume:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-amazon-ebsvolume oracle-oci:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-oracle-oci ncloud:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-ncloud hyperv-vmcx:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-hyperv-vmcx virtualbox-iso:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-virtualbox-iso hcloud:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-hcloud parallels-iso:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-parallels-iso hyperv-iso:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-hyperv-iso amazon-ebssurrogate:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-amazon-ebssurrogate oneandone:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-oneandone vmware-vmx:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-vmware-vmx openstack:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-openstack vmware-iso:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-vmware-iso googlecompute:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-googlecompute triton:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-triton docker:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-docker parallels-pvm:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-parallels-pvm digitalocean:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-digitalocean azure-arm:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-azure-arm amazon-chroot:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-amazon-chroot lxd:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-lxd virtualbox-ovf:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-virtualbox-ovf cloudstack:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-cloudstack null:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-null amazon-ebs:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-amazon-ebs file:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-file lxc:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-lxc scaleway:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-scaleway alicloud-ecs:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-alicloud-ecs profitbricks:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-profitbricks qemu:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-qemu amazon-instance:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-amazon-instance oracle-classic:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-builder-oracle-classic] PostProcessors:map[artifice:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-artifice docker-import:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-docker-import googlecompute-export:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-googlecompute-export manifest:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-manifest docker-push:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-docker-push checksum:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-checksum googlecompute-import:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-googlecompute-import vsphere-template:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-vsphere-template shell-local:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-shell-local amazon-import:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-amazon-import docker-tag:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-docker-tag vsphere:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-vsphere docker-save:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-docker-save vagrant-cloud:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-vagrant-cloud vagrant:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-vagrant compress:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-compress alicloud-import:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-post-processor-alicloud-import] Provisioners:map[puppet-masterless:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-puppet-masterless puppet-server:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-puppet-server chef-solo:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-chef-solo chef-client:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-chef-client salt-masterless:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-salt-masterless ansible-local:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-ansible-local ansible:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-ansible file:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-file shell-local:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-shell-local windows-restart:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-windows-restart powershell:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-powershell shell:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-shell converge:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-converge windows-shell:/usr/local/bin/packer-PACKERSPACE-plugin-PACKERSPACE-packer-provisioner-windows-shell]}
2018/12/08 18:16:14 Detected home directory from env var: /Users/mukund_bihari
2018/12/08 18:16:14 Setting cache directory: /Users/mukund_bihari/git/packer/packer_cache
2018/12/08 18:16:14 Detected home directory from env var: /Users/mukund_bihari
2018/12/08 18:16:14 Loading builder: vmware-iso
2018/12/08 18:16:14 Plugin could not be found. Checking same directory as executable.
2018/12/08 18:16:14 Current exe path: /usr/local/bin/packer
2018/12/08 18:16:14 Creating plugin client for path: /usr/local/bin/packer
2018/12/08 18:16:14 Starting plugin: /usr/local/bin/packer []string{"/usr/local/bin/packer", "plugin", "packer-builder-vmware-iso"}
2018/12/08 18:16:14 Waiting for RPC address for: /usr/local/bin/packer
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [INFO] Packer version: 1.3.2
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Packer Target OS/Arch: darwin amd64
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Built with Go Version: go1.11.1
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Detected home directory from env var: /Users/mukund_bihari
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Attempting to open config file: /Users/mukund_bihari/.packerconfig
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [WARN] Config file doesn't exist: /Users/mukund_bihari/.packerconfig
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Packer config: &{DisableCheckpoint:false DisableCheckpointSignature:false PluginMinPort:10000 PluginMaxPort:25000 Builders:map[] PostProcessors:map[] Provisioners:map[]}
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Detected home directory from env var: /Users/mukund_bihari
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Setting cache directory: /Users/mukund_bihari/git/packer/packer_cache
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Detected home directory from env var: /Users/mukund_bihari
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 args: []string{"packer-builder-vmware-iso"}
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Plugin minimum port: 10000
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Plugin maximum port: 25000
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Plugin address: unix /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/packer-plugin937386510
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Waiting for connection...
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Serving a plugin connection...
2018/12/08 18:16:14 Loading provisioner: shell
2018/12/08 18:16:14 Plugin could not be found. Checking same directory as executable.
2018/12/08 18:16:14 Current exe path: /usr/local/bin/packer
2018/12/08 18:16:14 Creating plugin client for path: /usr/local/bin/packer
2018/12/08 18:16:14 Starting plugin: /usr/local/bin/packer []string{"/usr/local/bin/packer", "plugin", "packer-provisioner-shell"}
2018/12/08 18:16:14 Waiting for RPC address for: /usr/local/bin/packer
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [INFO] Packer version: 1.3.2
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Packer Target OS/Arch: darwin amd64
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Built with Go Version: go1.11.1
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Detected home directory from env var: /Users/mukund_bihari
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Attempting to open config file: /Users/mukund_bihari/.packerconfig
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [WARN] Config file doesn't exist: /Users/mukund_bihari/.packerconfig
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Packer config: &{DisableCheckpoint:false DisableCheckpointSignature:false PluginMinPort:10000 PluginMaxPort:25000 Builders:map[] PostProcessors:map[] Provisioners:map[]}
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Detected home directory from env var: /Users/mukund_bihari
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Setting cache directory: /Users/mukund_bihari/git/packer/packer_cache
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Detected home directory from env var: /Users/mukund_bihari
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 args: []string{"packer-provisioner-shell"}
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Plugin minimum port: 10000
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Plugin maximum port: 25000
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Plugin address: unix /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/packer-plugin292190098
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Waiting for connection...
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Serving a plugin connection...
2018/12/08 18:16:14 Build debug mode: false
2018/12/08 18:16:14 Force build: false
2018/12/08 18:16:14 On error: 
2018/12/08 18:16:14 Preparing build: coreos-stable
coreos-stable output will be in this color.

2018/12/08 18:16:14 Waiting on builds to complete...
2018/12/08 18:16:14 Starting build run: coreos-stable
2018/12/08 18:16:14 Running builder: vmware-iso
2018/12/08 18:16:14 [INFO] (telemetry) Starting builder vmware-iso
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [DEBUG] reconnecting to TCP connection for SSH
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [DEBUG] handshaking with SSH
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Keyboard interactive challenge:
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 -- User:
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 -- Instructions:
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 -- Question 1: Password:
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Keyboard interactive challenge:
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 -- User:
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 -- Instructions:
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [DEBUG] handshake complete!
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [DEBUG] Opening new ssh session
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [INFO] agent forwarding enabled
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [DEBUG] Opening new ssh session
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [DEBUG] starting remote command: esxcli --formatter csv system version get
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Connected to VMware ESXi 6.7.0 Releasebuild-8169922
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [DEBUG] Opening new ssh session
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 [DEBUG] starting remote command: esxcli --formatter csv system settings advanced list -o /Net/GuestIPHack
==> coreos-stable: Retrieving ISO
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Acquiring lock to download: http://stable.release.core-os.net/amd64-usr/1688.5.3/coreos_production_iso_image.iso
2018/12/08 18:16:14 packer: 2018/12/08 18:16:14 Verifying checksum of /Users/mukund_bihari/git/packer/packer_cache/b780b7b46f9fbe2e3ba5e25eff7636176d7aa32debf2e9e7ae74e5e57ada4ced.iso
    coreos-stable: Found already downloaded, initial checksum matched, no download needed: http://stable.release.core-os.net/amd64-usr/1688.5.3/coreos_production_iso_image.iso
2018/12/08 18:16:15 packer: 2018/12/08 18:16:15 [DEBUG] Opening new ssh session
2018/12/08 18:16:15 packer: 2018/12/08 18:16:15 [DEBUG] starting remote command: test -e "/vmfs/volumes/datastore1/coreos-stable-1688.5.3"
2018/12/08 18:16:15 packer: 2018/12/08 18:16:15 [ERROR] Remote command exited with '1': test -e "/vmfs/volumes/datastore1/coreos-stable-1688.5.3"
2018/12/08 18:16:15 packer: 2018/12/08 18:16:15 [DEBUG] Opening new ssh session
2018/12/08 18:16:15 packer: 2018/12/08 18:16:15 [DEBUG] starting remote command: mkdir -p "/vmfs/volumes/datastore1/coreos-stable-1688.5.3"
2018/12/08 18:16:15 packer: 2018/12/08 18:16:15 No floppy files specified. Floppy disk will not be made.
2018/12/08 18:16:15 packer: 2018/12/08 18:16:15 [DEBUG] Opening new ssh session
2018/12/08 18:16:15 packer: 2018/12/08 18:16:15 [DEBUG] starting remote command: sha256sum -c
==> coreos-stable: Remote cache was verified skipping remote upload...
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [INFO] Creating disk with Path: coreos-stable-1688.5.3/disk.vmdk and Size: 40960M
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] Opening new ssh session
==> coreos-stable: Creating required virtual machine disks
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] starting remote command: vmkfstools -c 40960M -d thin -a lsilogic "/vmfs/volumes/datastore1/coreos-stable-1688.5.3/disk.vmdk"
==> coreos-stable: Building and writing VMX file
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Writing VMX to: /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/packer-vmx013901845/coreos-stable-1688.5.3.vmx
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Setting VMX: 'cpuid.coresPerSocket' = '1'
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Setting VMX: 'memsize' = '2048'
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Setting VMX: 'numvcpus' = '2'
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Setting VMX: 'vhv.enable' = 'TRUE'
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Setting VMX: 'ethernet0.networkName' = 'VM Network'
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Writing VMX to: /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/packer-vmx013901845/coreos-stable-1688.5.3.vmx
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Suppressing messages in VMX
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Trying port: 8637
==> coreos-stable: Starting HTTP server on port 8637
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Looking for available port between 5900 and 6000
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] Opening new ssh session
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] starting remote command: esxcli --formatter csv network ip connection list
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address [::]:22, port 22 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address 0.0.0.0:22, port 22 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address [fe80:2::20c:29ff:fead:68b3]:427, port 427 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address 192.168.200.130:427, port 427 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address 0.0.0.0:443, port 443 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address [::]:443, port 443 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address 0.0.0.0:80, port 80 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address [::]:80, port 80 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address [::]:9080, port 9080 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address [::]:8000, port 8000 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address [::]:902, port 902 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address 0.0.0.0:902, port 902 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 ESXi listening on address [::]:8300, port 8300 unavailable for VNC
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Trying address: 192.168.200.130:5900...
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Found available VNC port: 5900
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 Writing VMX to: /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/packer-vmx013901845/coreos-stable-1688.5.3.vmx
==> coreos-stable: Registering remote VM...
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] Opening new ssh session
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] Starting remote scp process:  scp -vt /vmfs/volumes/datastore1/coreos-stable-1688.5.3
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] Started SCP session, beginning transfers...
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] Copying input data into temporary file so we can read the length
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] scp: Uploading coreos-stable-1688.5.3.vmx: perms=C0644 size=2975
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] SCP session complete, closing stdin pipe.
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] Waiting for SSH session to complete.
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] scp stderr (length 44): Sink: C0644 2975 coreos-stable-1688.5.3.vmx
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] Opening new ssh session
2018/12/08 18:16:18 packer: 2018/12/08 18:16:18 [DEBUG] starting remote command: vim-cmd solo/registervm "/vmfs/volumes/datastore1/coreos-stable-1688.5.3/coreos-stable-1688.5.3.vmx"
==> coreos-stable: Starting virtual machine...
2018/12/08 18:16:19 packer: 2018/12/08 18:16:19 [DEBUG] Opening new ssh session
2018/12/08 18:16:19 packer: 2018/12/08 18:16:19 [DEBUG] starting remote command: vim-cmd vmsvc/power.on 18
2018/12/08 18:16:19 packer: 2018/12/08 18:16:19 [DEBUG] Opening new ssh session
2018/12/08 18:16:19 packer: 2018/12/08 18:16:19 [DEBUG] starting remote command: vim-cmd vmsvc/power.getstate 18
==> coreos-stable: Waiting 30s for boot...
==> coreos-stable: Connecting to VM via VNC (192.168.200.130:5900)
2018/12/08 18:16:49 packer: 2018/12/08 18:16:49 Connected to VNC desktop: coreos-stable-1688.5.3
2018/12/08 18:16:49 packer: 2018/12/08 18:16:49 Host IP for the VMware machine: 192.168.200.1
==> coreos-stable: Typing the boot command over VNC...
2018/12/08 18:16:49 packer: 2018/12/08 18:16:49 Sending char 's', code 0x73, shift false
2018/12/08 18:16:50 packer: 2018/12/08 18:16:50 Sending char 'u', code 0x75, shift false
2018/12/08 18:16:50 packer: 2018/12/08 18:16:50 Sending char 'd', code 0x64, shift false
2018/12/08 18:16:50 packer: 2018/12/08 18:16:50 Sending char 'o', code 0x6F, shift false
2018/12/08 18:16:50 packer: 2018/12/08 18:16:50 Sending char ' ', code 0x20, shift false
2018/12/08 18:16:51 packer: 2018/12/08 18:16:51 Sending char '-', code 0x2D, shift false
2018/12/08 18:16:51 packer: 2018/12/08 18:16:51 Sending char 'i', code 0x69, shift false
2018/12/08 18:16:51 packer: 2018/12/08 18:16:51 Special code '<enter>' found, replacing with: 0xFF0D
2018/12/08 18:16:51 packer: 2018/12/08 18:16:51 Sending char 's', code 0x73, shift false
2018/12/08 18:16:51 packer: 2018/12/08 18:16:51 Sending char 'y', code 0x79, shift false
2018/12/08 18:16:52 packer: 2018/12/08 18:16:52 Sending char 's', code 0x73, shift false
2018/12/08 18:16:52 packer: 2018/12/08 18:16:52 Sending char 't', code 0x74, shift false
2018/12/08 18:16:52 packer: 2018/12/08 18:16:52 Sending char 'e', code 0x65, shift false
2018/12/08 18:16:52 packer: 2018/12/08 18:16:52 Sending char 'm', code 0x6D, shift false
2018/12/08 18:16:52 packer: 2018/12/08 18:16:52 Sending char 'c', code 0x63, shift false
2018/12/08 18:16:53 packer: 2018/12/08 18:16:53 Sending char 't', code 0x74, shift false
2018/12/08 18:16:53 packer: 2018/12/08 18:16:53 Sending char 'l', code 0x6C, shift false
2018/12/08 18:16:53 packer: 2018/12/08 18:16:53 Sending char ' ', code 0x20, shift false
2018/12/08 18:16:53 packer: 2018/12/08 18:16:53 Sending char 's', code 0x73, shift false
2018/12/08 18:16:53 packer: 2018/12/08 18:16:53 Sending char 't', code 0x74, shift false
2018/12/08 18:16:54 packer: 2018/12/08 18:16:54 Sending char 'o', code 0x6F, shift false
2018/12/08 18:16:54 packer: 2018/12/08 18:16:54 Sending char 'p', code 0x70, shift false
2018/12/08 18:16:54 packer: 2018/12/08 18:16:54 Sending char ' ', code 0x20, shift false
2018/12/08 18:16:54 packer: 2018/12/08 18:16:54 Sending char 's', code 0x73, shift false
2018/12/08 18:16:54 packer: 2018/12/08 18:16:54 Sending char 's', code 0x73, shift false
2018/12/08 18:16:55 packer: 2018/12/08 18:16:55 Sending char 'h', code 0x68, shift false
2018/12/08 18:16:55 packer: 2018/12/08 18:16:55 Sending char 'd', code 0x64, shift false
2018/12/08 18:16:55 packer: 2018/12/08 18:16:55 Sending char '.', code 0x2E, shift false
2018/12/08 18:16:55 packer: 2018/12/08 18:16:55 Sending char 's', code 0x73, shift false
2018/12/08 18:16:56 packer: 2018/12/08 18:16:56 Sending char 'o', code 0x6F, shift false
2018/12/08 18:16:56 packer: 2018/12/08 18:16:56 Sending char 'c', code 0x63, shift false
2018/12/08 18:16:56 packer: 2018/12/08 18:16:56 Sending char 'k', code 0x6B, shift false
2018/12/08 18:16:56 packer: 2018/12/08 18:16:56 Sending char 'e', code 0x65, shift false
2018/12/08 18:16:56 packer: 2018/12/08 18:16:56 Sending char 't', code 0x74, shift false
2018/12/08 18:16:57 packer: 2018/12/08 18:16:57 Special code '<enter>' found, replacing with: 0xFF0D
2018/12/08 18:16:57 packer: 2018/12/08 18:16:57 Sending char 'w', code 0x77, shift false
2018/12/08 18:16:57 packer: 2018/12/08 18:16:57 Sending char 'g', code 0x67, shift false
2018/12/08 18:16:57 packer: 2018/12/08 18:16:57 Sending char 'e', code 0x65, shift false
2018/12/08 18:16:57 packer: 2018/12/08 18:16:57 Sending char 't', code 0x74, shift false
2018/12/08 18:16:58 packer: 2018/12/08 18:16:58 Sending char ' ', code 0x20, shift false
2018/12/08 18:16:58 packer: 2018/12/08 18:16:58 Sending char 'h', code 0x68, shift false
2018/12/08 18:16:58 packer: 2018/12/08 18:16:58 Sending char 't', code 0x74, shift false
2018/12/08 18:16:58 packer: 2018/12/08 18:16:58 Sending char 't', code 0x74, shift false
2018/12/08 18:16:58 packer: 2018/12/08 18:16:58 Sending char 'p', code 0x70, shift false
2018/12/08 18:16:59 packer: 2018/12/08 18:16:59 Sending char ':', code 0x3A, shift true
2018/12/08 18:16:59 packer: 2018/12/08 18:16:59 Sending char '/', code 0x2F, shift false
2018/12/08 18:16:59 packer: 2018/12/08 18:16:59 Sending char '/', code 0x2F, shift false
2018/12/08 18:16:59 packer: 2018/12/08 18:16:59 Sending char '1', code 0x31, shift false
2018/12/08 18:17:00 packer: 2018/12/08 18:17:00 Sending char '9', code 0x39, shift false
2018/12/08 18:17:00 packer: 2018/12/08 18:17:00 Sending char '2', code 0x32, shift false
2018/12/08 18:17:00 packer: 2018/12/08 18:17:00 Sending char '.', code 0x2E, shift false
2018/12/08 18:17:00 packer: 2018/12/08 18:17:00 Sending char '1', code 0x31, shift false
2018/12/08 18:17:01 packer: 2018/12/08 18:17:00 Sending char '6', code 0x36, shift false
2018/12/08 18:17:01 packer: 2018/12/08 18:17:01 Sending char '8', code 0x38, shift false
2018/12/08 18:17:01 packer: 2018/12/08 18:17:01 Sending char '.', code 0x2E, shift false
2018/12/08 18:17:01 packer: 2018/12/08 18:17:01 Sending char '2', code 0x32, shift false
2018/12/08 18:17:01 packer: 2018/12/08 18:17:01 Sending char '0', code 0x30, shift false
2018/12/08 18:17:02 packer: 2018/12/08 18:17:02 Sending char '0', code 0x30, shift false
2018/12/08 18:17:02 packer: 2018/12/08 18:17:02 Sending char '.', code 0x2E, shift false
2018/12/08 18:17:02 packer: 2018/12/08 18:17:02 Sending char '1', code 0x31, shift false
2018/12/08 18:17:02 packer: 2018/12/08 18:17:02 Sending char ':', code 0x3A, shift true
2018/12/08 18:17:03 packer: 2018/12/08 18:17:03 Sending char '8', code 0x38, shift false
2018/12/08 18:17:03 packer: 2018/12/08 18:17:03 Sending char '6', code 0x36, shift false
2018/12/08 18:17:03 packer: 2018/12/08 18:17:03 Sending char '3', code 0x33, shift false
2018/12/08 18:17:03 packer: 2018/12/08 18:17:03 Sending char '7', code 0x37, shift false
2018/12/08 18:17:03 packer: 2018/12/08 18:17:03 Sending char '/', code 0x2F, shift false
2018/12/08 18:17:04 packer: 2018/12/08 18:17:04 Sending char 'i', code 0x69, shift false
2018/12/08 18:17:04 packer: 2018/12/08 18:17:04 Sending char 'n', code 0x6E, shift false
2018/12/08 18:17:04 packer: 2018/12/08 18:17:04 Sending char 's', code 0x73, shift false
2018/12/08 18:17:04 packer: 2018/12/08 18:17:04 Sending char 't', code 0x74, shift false
2018/12/08 18:17:04 packer: 2018/12/08 18:17:04 Sending char 'a', code 0x61, shift false
2018/12/08 18:17:05 packer: 2018/12/08 18:17:05 Sending char 'l', code 0x6C, shift false
2018/12/08 18:17:05 packer: 2018/12/08 18:17:05 Sending char 'l', code 0x6C, shift false
2018/12/08 18:17:05 packer: 2018/12/08 18:17:05 Sending char '.', code 0x2E, shift false
2018/12/08 18:17:05 packer: 2018/12/08 18:17:05 Sending char 'y', code 0x79, shift false
2018/12/08 18:17:05 packer: 2018/12/08 18:17:05 Sending char 'm', code 0x6D, shift false
2018/12/08 18:17:06 packer: 2018/12/08 18:17:06 Sending char 'l', code 0x6C, shift false
2018/12/08 18:17:06 packer: 2018/12/08 18:17:06 Special code '<enter>' found, replacing with: 0xFF0D
2018/12/08 18:17:06 packer: 2018/12/08 18:17:06 Sending char 'c', code 0x63, shift false
2018/12/08 18:17:06 packer: 2018/12/08 18:17:06 Sending char 'o', code 0x6F, shift false
2018/12/08 18:17:07 packer: 2018/12/08 18:17:07 Sending char 'r', code 0x72, shift false
2018/12/08 18:17:07 packer: 2018/12/08 18:17:07 Sending char 'e', code 0x65, shift false
2018/12/08 18:17:07 packer: 2018/12/08 18:17:07 Sending char 'o', code 0x6F, shift false
2018/12/08 18:17:07 packer: 2018/12/08 18:17:07 Sending char 's', code 0x73, shift false
2018/12/08 18:17:07 packer: 2018/12/08 18:17:07 Sending char '-', code 0x2D, shift false
2018/12/08 18:17:08 packer: 2018/12/08 18:17:08 Sending char 'i', code 0x69, shift false
2018/12/08 18:17:08 packer: 2018/12/08 18:17:08 Sending char 'n', code 0x6E, shift false
2018/12/08 18:17:08 packer: 2018/12/08 18:17:08 Sending char 's', code 0x73, shift false
2018/12/08 18:17:08 packer: 2018/12/08 18:17:08 Sending char 't', code 0x74, shift false
2018/12/08 18:17:08 packer: 2018/12/08 18:17:08 Sending char 'a', code 0x61, shift false
2018/12/08 18:17:09 packer: 2018/12/08 18:17:09 Sending char 'l', code 0x6C, shift false
2018/12/08 18:17:09 packer: 2018/12/08 18:17:09 Sending char 'l', code 0x6C, shift false
2018/12/08 18:17:09 packer: 2018/12/08 18:17:09 Sending char ' ', code 0x20, shift false
2018/12/08 18:17:09 packer: 2018/12/08 18:17:09 Sending char '-', code 0x2D, shift false
2018/12/08 18:17:09 packer: 2018/12/08 18:17:09 Sending char 'd', code 0x64, shift false
2018/12/08 18:17:10 packer: 2018/12/08 18:17:10 Sending char ' ', code 0x20, shift false
2018/12/08 18:17:10 packer: 2018/12/08 18:17:10 Sending char '/', code 0x2F, shift false
2018/12/08 18:17:10 packer: 2018/12/08 18:17:10 Sending char 'd', code 0x64, shift false
2018/12/08 18:17:10 packer: 2018/12/08 18:17:10 Sending char 'e', code 0x65, shift false
2018/12/08 18:17:10 packer: 2018/12/08 18:17:10 Sending char 'v', code 0x76, shift false
2018/12/08 18:17:11 packer: 2018/12/08 18:17:11 Sending char '/', code 0x2F, shift false
2018/12/08 18:17:11 packer: 2018/12/08 18:17:11 Sending char 's', code 0x73, shift false
2018/12/08 18:17:11 packer: 2018/12/08 18:17:11 Sending char 'd', code 0x64, shift false
2018/12/08 18:17:11 packer: 2018/12/08 18:17:11 Sending char 'a', code 0x61, shift false
2018/12/08 18:17:11 packer: 2018/12/08 18:17:11 Sending char ' ', code 0x20, shift false
2018/12/08 18:17:12 packer: 2018/12/08 18:17:12 Sending char '-', code 0x2D, shift false
2018/12/08 18:17:12 packer: 2018/12/08 18:17:12 Sending char 'C', code 0x43, shift true
2018/12/08 18:17:12 packer: 2018/12/08 18:17:12 Sending char ' ', code 0x20, shift false
2018/12/08 18:17:13 packer: 2018/12/08 18:17:13 Sending char 's', code 0x73, shift false
2018/12/08 18:17:13 packer: 2018/12/08 18:17:13 Sending char 't', code 0x74, shift false
2018/12/08 18:17:13 packer: 2018/12/08 18:17:13 Sending char 'a', code 0x61, shift false
2018/12/08 18:17:13 packer: 2018/12/08 18:17:13 Sending char 'b', code 0x62, shift false
2018/12/08 18:17:13 packer: 2018/12/08 18:17:13 Sending char 'l', code 0x6C, shift false
2018/12/08 18:17:14 packer: 2018/12/08 18:17:14 Sending char 'e', code 0x65, shift false
2018/12/08 18:17:14 packer: 2018/12/08 18:17:14 Sending char ' ', code 0x20, shift false
2018/12/08 18:17:14 packer: 2018/12/08 18:17:14 Sending char '-', code 0x2D, shift false
2018/12/08 18:17:14 packer: 2018/12/08 18:17:14 Sending char 'c', code 0x63, shift false
2018/12/08 18:17:14 packer: 2018/12/08 18:17:14 Sending char ' ', code 0x20, shift false
2018/12/08 18:17:15 packer: 2018/12/08 18:17:15 Sending char 'i', code 0x69, shift false
2018/12/08 18:17:15 packer: 2018/12/08 18:17:15 Sending char 'n', code 0x6E, shift false
2018/12/08 18:17:15 packer: 2018/12/08 18:17:15 Sending char 's', code 0x73, shift false
2018/12/08 18:17:15 packer: 2018/12/08 18:17:15 Sending char 't', code 0x74, shift false
2018/12/08 18:17:15 packer: 2018/12/08 18:17:15 Sending char 'a', code 0x61, shift false
2018/12/08 18:17:16 packer: 2018/12/08 18:17:16 Sending char 'l', code 0x6C, shift false
2018/12/08 18:17:16 packer: 2018/12/08 18:17:16 Sending char 'l', code 0x6C, shift false
2018/12/08 18:17:16 packer: 2018/12/08 18:17:16 Sending char '.', code 0x2E, shift false
2018/12/08 18:17:16 packer: 2018/12/08 18:17:16 Sending char 'y', code 0x79, shift false
2018/12/08 18:17:16 packer: 2018/12/08 18:17:16 Sending char 'm', code 0x6D, shift false
2018/12/08 18:17:17 packer: 2018/12/08 18:17:17 Sending char 'l', code 0x6C, shift false
2018/12/08 18:17:17 packer: 2018/12/08 18:17:17 Special code '<enter>' found, replacing with: 0xFF0D
2018/12/08 18:17:17 packer: 2018/12/08 18:17:17 Sending char 'r', code 0x72, shift false
2018/12/08 18:17:17 packer: 2018/12/08 18:17:17 Sending char 'e', code 0x65, shift false
2018/12/08 18:17:18 packer: 2018/12/08 18:17:18 Sending char 'b', code 0x62, shift false
2018/12/08 18:17:18 packer: 2018/12/08 18:17:18 Sending char 'o', code 0x6F, shift false
2018/12/08 18:17:18 packer: 2018/12/08 18:17:18 Sending char 'o', code 0x6F, shift false
2018/12/08 18:17:18 packer: 2018/12/08 18:17:18 Sending char 't', code 0x74, shift false
2018/12/08 18:17:18 packer: 2018/12/08 18:17:18 Special code '<enter>' found, replacing with: 0xFF0D
2018/12/08 18:17:19 packer: 2018/12/08 18:17:19 [DEBUG] Opening new ssh session
2018/12/08 18:17:19 packer: 2018/12/08 18:17:19 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:17:19 packer: 2018/12/08 18:17:19 [DEBUG] Opening new ssh session
2018/12/08 18:17:19 packer: 2018/12/08 18:17:19 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:17:21 packer: 2018/12/08 18:17:21 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:17:21 packer: 2018/12/08 18:17:21 [DEBUG] Unable to get address during connection step: No interface on the VM has an IP address ready
2018/12/08 18:17:21 packer: 2018/12/08 18:17:21 [INFO] Waiting for SSH, up to timeout: 50m0s
==> coreos-stable: Waiting for SSH to become available...
2018/12/08 18:17:21 packer: 2018/12/08 18:17:21 [DEBUG] Opening new ssh session
2018/12/08 18:17:21 packer: 2018/12/08 18:17:21 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:17:21 packer: 2018/12/08 18:17:21 [DEBUG] Opening new ssh session
2018/12/08 18:17:21 packer: 2018/12/08 18:17:21 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:17:23 packer: 2018/12/08 18:17:23 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:17:23 packer: 2018/12/08 18:17:23 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:17:28 packer: 2018/12/08 18:17:28 [DEBUG] Opening new ssh session
2018/12/08 18:17:28 packer: 2018/12/08 18:17:28 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:17:28 packer: 2018/12/08 18:17:28 [DEBUG] Opening new ssh session
2018/12/08 18:17:28 packer: 2018/12/08 18:17:28 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:17:29 packer: 2018/12/08 18:17:29 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:17:29 packer: 2018/12/08 18:17:29 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:17:34 packer: 2018/12/08 18:17:34 [DEBUG] Opening new ssh session
2018/12/08 18:17:34 packer: 2018/12/08 18:17:34 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:17:35 packer: 2018/12/08 18:17:35 [DEBUG] Opening new ssh session
2018/12/08 18:17:35 packer: 2018/12/08 18:17:35 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:17:36 packer: 2018/12/08 18:17:36 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:17:36 packer: 2018/12/08 18:17:36 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:17:41 packer: 2018/12/08 18:17:41 [DEBUG] Opening new ssh session
2018/12/08 18:17:41 packer: 2018/12/08 18:17:41 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:17:41 packer: 2018/12/08 18:17:41 [DEBUG] Opening new ssh session
2018/12/08 18:17:41 packer: 2018/12/08 18:17:41 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:17:43 packer: 2018/12/08 18:17:43 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:17:43 packer: 2018/12/08 18:17:43 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:17:48 packer: 2018/12/08 18:17:48 [DEBUG] Opening new ssh session
2018/12/08 18:17:48 packer: 2018/12/08 18:17:48 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:17:48 packer: 2018/12/08 18:17:48 [DEBUG] Opening new ssh session
2018/12/08 18:17:48 packer: 2018/12/08 18:17:48 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:17:50 packer: 2018/12/08 18:17:50 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:17:50 packer: 2018/12/08 18:17:50 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:17:55 packer: 2018/12/08 18:17:55 [DEBUG] Opening new ssh session
2018/12/08 18:17:55 packer: 2018/12/08 18:17:55 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:17:55 packer: 2018/12/08 18:17:55 [DEBUG] Opening new ssh session
2018/12/08 18:17:55 packer: 2018/12/08 18:17:55 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:17:56 packer: 2018/12/08 18:17:56 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:17:56 packer: 2018/12/08 18:17:56 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:18:01 packer: 2018/12/08 18:18:01 [DEBUG] Opening new ssh session
2018/12/08 18:18:01 packer: 2018/12/08 18:18:01 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:18:02 packer: 2018/12/08 18:18:02 [DEBUG] Opening new ssh session
2018/12/08 18:18:02 packer: 2018/12/08 18:18:02 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:18:03 packer: 2018/12/08 18:18:03 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:18:03 packer: 2018/12/08 18:18:03 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:18:08 packer: 2018/12/08 18:18:08 [DEBUG] Opening new ssh session
2018/12/08 18:18:08 packer: 2018/12/08 18:18:08 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:18:09 packer: 2018/12/08 18:18:09 [DEBUG] Opening new ssh session
2018/12/08 18:18:09 packer: 2018/12/08 18:18:09 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:18:10 packer: 2018/12/08 18:18:10 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:18:10 packer: 2018/12/08 18:18:10 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:18:15 packer: 2018/12/08 18:18:15 [DEBUG] Opening new ssh session
2018/12/08 18:18:15 packer: 2018/12/08 18:18:15 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:18:16 packer: 2018/12/08 18:18:16 [DEBUG] Opening new ssh session
2018/12/08 18:18:16 packer: 2018/12/08 18:18:16 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:18:17 packer: 2018/12/08 18:18:17 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:18:17 packer: 2018/12/08 18:18:17 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:18:22 packer: 2018/12/08 18:18:22 [DEBUG] Opening new ssh session
2018/12/08 18:18:22 packer: 2018/12/08 18:18:22 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:18:22 packer: 2018/12/08 18:18:22 [DEBUG] Opening new ssh session
2018/12/08 18:18:22 packer: 2018/12/08 18:18:22 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:18:24 packer: 2018/12/08 18:18:24 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:18:24 packer: 2018/12/08 18:18:24 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:18:29 packer: 2018/12/08 18:18:29 [DEBUG] Opening new ssh session
2018/12/08 18:18:29 packer: 2018/12/08 18:18:29 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:18:29 packer: 2018/12/08 18:18:29 [DEBUG] Opening new ssh session
2018/12/08 18:18:29 packer: 2018/12/08 18:18:29 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:18:31 packer: 2018/12/08 18:18:31 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:18:31 packer: 2018/12/08 18:18:31 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:18:36 packer: 2018/12/08 18:18:36 [DEBUG] Opening new ssh session
2018/12/08 18:18:36 packer: 2018/12/08 18:18:36 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:18:36 packer: 2018/12/08 18:18:36 [DEBUG] Opening new ssh session
2018/12/08 18:18:36 packer: 2018/12/08 18:18:36 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:18:37 packer: 2018/12/08 18:18:37 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:18:37 packer: 2018/12/08 18:18:37 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:18:42 packer: 2018/12/08 18:18:42 [DEBUG] Opening new ssh session
2018/12/08 18:18:42 packer: 2018/12/08 18:18:42 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:18:43 packer: 2018/12/08 18:18:43 [DEBUG] Opening new ssh session
2018/12/08 18:18:43 packer: 2018/12/08 18:18:43 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:18:44 packer: 2018/12/08 18:18:44 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:18:44 packer: 2018/12/08 18:18:44 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:18:49 packer: 2018/12/08 18:18:49 [DEBUG] Opening new ssh session
2018/12/08 18:18:49 packer: 2018/12/08 18:18:49 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:18:49 packer: 2018/12/08 18:18:49 [DEBUG] Opening new ssh session
2018/12/08 18:18:49 packer: 2018/12/08 18:18:49 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:18:51 packer: 2018/12/08 18:18:51 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:18:51 packer: 2018/12/08 18:18:51 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:18:56 packer: 2018/12/08 18:18:56 [DEBUG] Opening new ssh session
2018/12/08 18:18:56 packer: 2018/12/08 18:18:56 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:18:56 packer: 2018/12/08 18:18:56 [DEBUG] Opening new ssh session
2018/12/08 18:18:56 packer: 2018/12/08 18:18:56 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:18:58 packer: 2018/12/08 18:18:58 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:18:58 packer: 2018/12/08 18:18:58 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:19:03 packer: 2018/12/08 18:19:03 [DEBUG] Opening new ssh session
2018/12/08 18:19:03 packer: 2018/12/08 18:19:03 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:19:03 packer: 2018/12/08 18:19:03 [DEBUG] Opening new ssh session
2018/12/08 18:19:03 packer: 2018/12/08 18:19:03 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:19:04 packer: 2018/12/08 18:19:04 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:19:04 packer: 2018/12/08 18:19:04 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:19:09 packer: 2018/12/08 18:19:09 [DEBUG] Opening new ssh session
2018/12/08 18:19:09 packer: 2018/12/08 18:19:09 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:19:10 packer: 2018/12/08 18:19:10 [DEBUG] Opening new ssh session
2018/12/08 18:19:10 packer: 2018/12/08 18:19:10 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:19:11 packer: 2018/12/08 18:19:11 Connection refused when connecting to: 192.168.200.134
2018/12/08 18:19:11 packer: 2018/12/08 18:19:11 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:19:16 packer: 2018/12/08 18:19:16 [DEBUG] Opening new ssh session
2018/12/08 18:19:16 packer: 2018/12/08 18:19:16 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:19:16 packer: 2018/12/08 18:19:16 [DEBUG] Opening new ssh session
2018/12/08 18:19:16 packer: 2018/12/08 18:19:16 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:19:19 packer: 2018/12/08 18:19:19 Timeout connecting to 192.168.200.134
2018/12/08 18:19:19 packer: 2018/12/08 18:19:19 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:19:24 packer: 2018/12/08 18:19:24 [DEBUG] Opening new ssh session
2018/12/08 18:19:24 packer: 2018/12/08 18:19:24 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:19:24 packer: 2018/12/08 18:19:24 [DEBUG] Opening new ssh session
2018/12/08 18:19:24 packer: 2018/12/08 18:19:24 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:19:26 packer: 2018/12/08 18:19:26 Timeout connecting to 192.168.200.134
2018/12/08 18:19:26 packer: 2018/12/08 18:19:26 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:19:31 packer: 2018/12/08 18:19:31 [DEBUG] Opening new ssh session
2018/12/08 18:19:31 packer: 2018/12/08 18:19:31 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:19:32 packer: 2018/12/08 18:19:32 [DEBUG] Opening new ssh session
2018/12/08 18:19:32 packer: 2018/12/08 18:19:32 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:19:34 packer: 2018/12/08 18:19:34 Timeout connecting to 192.168.200.140
2018/12/08 18:19:34 packer: 2018/12/08 18:19:34 [DEBUG] Error getting SSH address: No interface on the VM has an IP address ready
2018/12/08 18:19:39 packer: 2018/12/08 18:19:39 [DEBUG] Opening new ssh session
2018/12/08 18:19:39 packer: 2018/12/08 18:19:39 [DEBUG] starting remote command: esxcli --formatter csv network vm list
2018/12/08 18:19:39 packer: 2018/12/08 18:19:39 [DEBUG] Opening new ssh session
2018/12/08 18:19:39 packer: 2018/12/08 18:19:39 [DEBUG] starting remote command: esxcli --formatter csv network vm port list -w 2125596
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] Attempting SSH connection...
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] reconnecting to TCP connection for SSH
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] handshaking with SSH
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] handshake complete!
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Opening new ssh session
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] agent forwarding enabled
==> coreos-stable: Connected to SSH!
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 Running the provision hook
2018/12/08 18:19:40 [INFO] (telemetry) Starting provisioner shell
==> coreos-stable: Provisioning with shell script: scripts/provision_vbox.sh
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 Opening scripts/provision_vbox.sh for reading
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Opening new ssh session
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] 173 bytes written for 'uploadData'
2018/12/08 18:19:40 [INFO] 173 bytes written for 'uploadData'
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Starting remote scp process:  scp -vt /tmp
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Started SCP session, beginning transfers...
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Copying input data into temporary file so we can read the length
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] scp: Uploading script_8955.sh: perms=C0644 size=173
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] SCP session complete, closing stdin pipe.
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Waiting for SSH session to complete.
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] scp stderr (length 31): Sink: C0644 173 script_8955.sh
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Opening new ssh session
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] starting remote command: chmod 0755 /tmp/script_8955.sh
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] RPC endpoint: Communicator ended with: 0
2018/12/08 18:19:40 [INFO] RPC client: Communicator ended with: 0
2018/12/08 18:19:40 [INFO] RPC endpoint: Communicator ended with: 0
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] RPC client: Communicator ended with: 0
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Opening new ssh session
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] starting remote command: echo 'test' | PACKER_BUILDER_TYPE='vmware-iso' PACKER_BUILD_NAME='coreos-stable' PACKER_HTTP_ADDR='192.168.200.1:8637'  sudo -S -E bash '/tmp/script_8955.sh'
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] RPC endpoint: Communicator ended with: 0
2018/12/08 18:19:40 [INFO] 0 bytes written for 'stdout'
2018/12/08 18:19:40 [INFO] 0 bytes written for 'stderr'
2018/12/08 18:19:40 [INFO] RPC client: Communicator ended with: 0
2018/12/08 18:19:40 [INFO] RPC endpoint: Communicator ended with: 0
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] 0 bytes written for 'stderr'
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] 0 bytes written for 'stdout'
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] RPC client: Communicator ended with: 0
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Opening new ssh session
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] starting remote command: rm -f /tmp/script_8955.sh
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] RPC endpoint: Communicator ended with: 0
2018/12/08 18:19:40 [INFO] RPC client: Communicator ended with: 0
2018/12/08 18:19:40 [INFO] RPC endpoint: Communicator ended with: 0
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] RPC client: Communicator ended with: 0
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Opening new ssh session
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] starting remote command: rm -f
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] RPC endpoint: Communicator ended with: 0
2018/12/08 18:19:40 [INFO] RPC client: Communicator ended with: 0
2018/12/08 18:19:40 [INFO] RPC endpoint: Communicator ended with: 0
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [INFO] RPC client: Communicator ended with: 0
2018/12/08 18:19:40 [INFO] (telemetry) ending shell
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 Executing shutdown command: sudo -S shutdown -P now
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Opening new ssh session
==> coreos-stable: Gracefully halting virtual machine...
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] starting remote command: sudo -S shutdown -P now
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 Waiting max 5m0s for shutdown to complete
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Opening new ssh session
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] starting remote command: vim-cmd vmsvc/power.getstate 18
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [ERROR] Remote command exited without exit status or exit signal.
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] Opening new ssh session
2018/12/08 18:19:40 packer: 2018/12/08 18:19:40 [DEBUG] starting remote command: vim-cmd vmsvc/power.getstate 18
2018/12/08 18:19:41 packer: 2018/12/08 18:19:41 [DEBUG] Opening new ssh session
2018/12/08 18:19:41 packer: 2018/12/08 18:19:41 [DEBUG] starting remote command: vim-cmd vmsvc/power.getstate 18
    coreos-stable: Waiting for VMware to clean up after itself...
2018/12/08 18:19:41 packer: 2018/12/08 18:19:41 [DEBUG] Opening new ssh session
2018/12/08 18:19:41 packer: 2018/12/08 18:19:41 [DEBUG] starting remote command: ls -1p /vmfs/volumes/datastore1/coreos-stable-1688.5.3
2018/12/08 18:19:41 packer: 2018/12/08 18:19:41 No more lock files found. VMware is clean.
2018/12/08 18:19:46 packer: 2018/12/08 18:19:46 VM shut down.
==> coreos-stable: Deleting unnecessary VMware files...
2018/12/08 18:19:46 packer: 2018/12/08 18:19:46 [DEBUG] Opening new ssh session
2018/12/08 18:19:46 packer: 2018/12/08 18:19:46 [DEBUG] starting remote command: ls -1p /vmfs/volumes/datastore1/coreos-stable-1688.5.3
2018/12/08 18:19:46 packer: 2018/12/08 18:19:46 [DEBUG] Opening new ssh session
    coreos-stable: Deleting: /vmfs/volumes/datastore1/coreos-stable-1688.5.3/vmware.log
2018/12/08 18:19:46 packer: 2018/12/08 18:19:46 [DEBUG] starting remote command: rm "/vmfs/volumes/datastore1/coreos-stable-1688.5.3/vmware.log"
==> coreos-stable: Compacting all attached virtual disks...
    coreos-stable: Compacting virtual disk 1
2018/12/08 18:19:46 packer: 2018/12/08 18:19:46 [DEBUG] Opening new ssh session
2018/12/08 18:19:46 packer: 2018/12/08 18:19:46 [DEBUG] starting remote command: vmkfstools --punchzero "/vmfs/volumes/datastore1/coreos-stable-1688.5.3/disk.vmdk"
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 Writing VMX to: /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/packer-vmx013901845/coreos-stable-1688.5.3.vmx
==> coreos-stable: Cleaning VMX prior to finishing up...
    coreos-stable: Unmounting floppy from VMX...
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 Deleting key: floppy0.present
    coreos-stable: Detaching ISO from CD-ROM device...
    coreos-stable: Disabling VNC server...
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 Writing VMX to: /var/folders/05/w5k53jgd55b80n9vwt8x3hm00000gn/T/packer-vmx013901845/coreos-stable-1688.5.3.vmx
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 [DEBUG] Opening new ssh session
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 [DEBUG] Starting remote scp process:  scp -vt /vmfs/volumes/datastore1/coreos-stable-1688.5.3
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 [DEBUG] Started SCP session, beginning transfers...
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 [DEBUG] Copying input data into temporary file so we can read the length
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 [DEBUG] scp: Uploading coreos-stable-1688.5.3.vmx: perms=C0644 size=2908
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 [DEBUG] SCP session complete, closing stdin pipe.
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 [DEBUG] Waiting for SSH session to complete.
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 [DEBUG] scp stderr (length 44): Sink: C0644 2908 coreos-stable-1688.5.3.vmx
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 [DEBUG] Opening new ssh session
2018/12/08 18:20:10 packer: 2018/12/08 18:20:10 [DEBUG] starting remote command: vim-cmd vmsvc/reload 18
==> coreos-stable: Exporting virtual machine...
    coreos-stable: Executing: ovftool --noSSLVerify=true --skipManifestCheck -tt=ovf vi://root:****@192.168.200.130/coreos-stable-1688.5.3 builds/coreos-stable-1688.5.3-vmware
    coreos-stable: Opening VI source: vi://root@192.168.200.130:443/coreos-stable-1688.5.3
    coreos-stable: Opening OVF target: builds/coreos-stable-1688.5.3-vmware
    coreos-stable: Opening OVF target: builds/coreos-stable-1688.5.3-vmware
    coreos-stable: Writing OVF package: builds/coreos-stable-1688.5.3-vmware/coreos-stable-1688.5.3/coreos-stable-1688.5.3.ovf
Transfer Completed                    
    coreos-stable: Writing OVF package: builds/coreos-stable-1688.5.3-vmware/coreos-stable-1688.5.3/coreos-stable-1688.5.3.ovf
    coreos-stable: Completed successfully
    coreos-stable:
2018/12/08 18:20:33 packer: 2018/12/08 18:20:33 [DEBUG] Opening new ssh session
2018/12/08 18:20:33 packer: 2018/12/08 18:20:33 [DEBUG] starting remote command: vim-cmd vmsvc/power.getstate 18
Transfer Completed                    
    coreos-stable: Completed successfully
    coreos-stable:
==> coreos-stable: Keeping virtual machine registered with ESX host (keep_registered = true)
2018/12/08 18:20:34 [INFO] (telemetry) ending vmware-iso
Build 'coreos-stable' finished.

2018/12/08 18:20:34 Builds completed. Waiting on interrupt barrier...
==> Builds finished. The artifacts of successful builds are:
2018/12/08 18:20:34 machine readable: coreos-stable,artifact-count []string{"1"}
==> Builds finished. The artifacts of successful builds are:
2018/12/08 18:20:34 machine readable: coreos-stable,artifact []string{"0", "builder-id", "mitchellh.vmware-esx"}
2018/12/08 18:20:34 machine readable: coreos-stable,artifact []string{"0", "id", "coreos-stable-1688.5.3"}
2018/12/08 18:20:34 machine readable: coreos-stable,artifact []string{"0", "string", "VM files in directory: builds/coreos-stable-1688.5.3-vmware"}
2018/12/08 18:20:34 machine readable: coreos-stable,artifact []string{"0", "files-count", "4"}
2018/12/08 18:20:34 machine readable: coreos-stable,artifact []string{"0", "file", "0", "builds/coreos-stable-1688.5.3-vmware/coreos-stable-1688.5.3/coreos-stable-1688.5.3-disk1.vmdk"}
2018/12/08 18:20:34 machine readable: coreos-stable,artifact []string{"0", "file", "1", "builds/coreos-stable-1688.5.3-vmware/coreos-stable-1688.5.3/coreos-stable-1688.5.3-file1.nvram"}
2018/12/08 18:20:34 machine readable: coreos-stable,artifact []string{"0", "file", "2", "builds/coreos-stable-1688.5.3-vmware/coreos-stable-1688.5.3/coreos-stable-1688.5.3.mf"}
2018/12/08 18:20:34 machine readable: coreos-stable,artifact []string{"0", "file", "3", "builds/coreos-stable-1688.5.3-vmware/coreos-stable-1688.5.3/coreos-stable-1688.5.3.ovf"}
2018/12/08 18:20:34 machine readable: coreos-stable,artifact []string{"0", "end"}
--> coreos-stable: VM files in directory: builds/coreos-stable-1688.5.3-vmware
2018/12/08 18:20:34 [INFO] (telemetry) Finalizing.
2018/12/08 18:20:35 waiting for all plugin processes to complete...
2018/12/08 18:20:35 /usr/local/bin/packer: plugin process exited
2018/12/08 18:20:35 /usr/local/bin/packer: plugin process exited

```

