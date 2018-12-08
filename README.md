# packer

This repo can be used to create images for VMs using packer on Virtual Box or ESXi.

##centos7-vbox.json can be used to commision a Centos VM tempalte for Virtual Box.


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

##centos7-vmware.json can be used to commision a Centos VM tempalte on ESXi.

_You can set ESXi on you local machine by downloading the VMware-VMvisor-Installer-6.7.0-8169922.x86_64.iso available on VMware official website. Trail copy has vailidity of 60 days. After it expires, simply uninstall it and resinstall to use it for next 60 days. Do not forget to take backup while uninstalling._

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
=========================================

![Alt text](img/vmware_iso_output.jpeg?raw=true "vmware_iso_output")

