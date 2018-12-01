# packer

This repo can be used to create images for VMs using packer.

* centos7-vbox.json can be used to commision a Centos VM tempalte for Virtual Box.

```
Command: packer build centos7-vmware.json

Sample Output:
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