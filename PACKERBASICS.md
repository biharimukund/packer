# PACKER

Packer is an open source tool for creating identical machine images for multiple platforms from a single source configuration.

* Packer is lightweight
* runs on every major operating system
* is highly performant, creating machine images for multiple platforms in parallel. 
* Improved stability. Packer installs and configures all the software for a machine at the time the image is built. If there are bugs in these scripts, they'll be caught early, rather than several minutes after a machine is launched.
* Greater testability. After a machine image is built, that machine image can be quickly launched and smoke tested to verify that things appear to be working. 
* Packer does not replace configuration management like Ansible or Chef. In fact, when building images, Packer is able to use tools like Ansible or Chef to install software onto the image.

## Why do we need Packer?

Pre-baked machine images have a lot of advantages, but most have been unable to benefit from them because images have been too tedious to create and manage. There were either no existing tools to automate the creation of machine images or they had too high of a learning curve. The result is that, prior to Packer, creating machine images threatened the agility of operations teams, and therefore aren't used, despite the massive benefits.

Packer changes all of this. Packer is easy to use and automates the creation of any type of machine image. It embraces modern configuration management by encouraging you to use a framework such as Chef or Puppet to install and configure the software within your Packer-made images.

In other words: Packer brings pre-baked images into the modern age, unlocking untapped potential and opening new opportunities.

## Use cases

**Continuous Delivery**
Packer is lightweight, portable, and command-line driven. This makes it the perfect tool to put in the middle of your continuous delivery pipeline. Packer can be used to generate new machine images for multiple platforms on every change to Chef/Puppet.

As part of this pipeline, the newly created images can then be launched and tested, verifying the infrastructure changes work. If the tests pass, you can be confident that the image will work when deployed. This brings a new level of stability and testability to infrastructure changes.

**Dev/Prod Parity**
Packer helps keep development, staging, and production as similar as possible. Packer can be used to generate images for multiple platforms at the same time. So if you use AWS for production and VMware (perhaps with Vagrant) for development, you can generate both an AMI and a VMware machine using Packer at the same time from the same template.

**Appliance/Demo Creation**
Since Packer creates consistent images for multiple platforms in parallel, it is perfect for creating appliances and disposable product demos. As your software changes, you can automatically create appliances with the software pre-installed. Potential users can then get started with your software by deploying it to the environment of their choice.

## Installation

Please follow the official [link](https://www.packer.io/intro/getting-started/install.html) for installation.

## Building image

Packer configuration templates are written in JSON format.

A template has the following three main parts.

1. variables — Where you define custom variables.

2. builders — Where you mention all the required VM/AMI parameters.

3. provisioners — Where you can integrate a shell script, ansible play or a chef cookbook for configuring a required application in the VM/AMI.

![Alt text](img/packer_template.jpeg?raw=true "packer template")


The configuration file used to define what image we want built and how is called a template in Packer terminology. The format of a template is simple JSON.

Official link: [packer](https://www.packer.io/intro/getting-started/build-image.html)

Below is an example of VM being created on Virtual box installed on local machine.

```
{

  "variables": {
    "ssh_username": "root",
    "ssh_password": "root"
  },

  "provisioners": [

    {
      "type": "shell",
      "execute_command": "echo 'vagrant' | {{.Vars}} sudo -S -E bash '{{.Path}}'",
      "script": "scripts/provision_vbox.sh" >> used to perform custom actions post commissioning of machine.
    }
  ],  

  "builders": [{

          "type": "virtualbox-iso", >> This is where we can define type. It can be vmware-iso, amazon-ebs etc
          "iso_url": "http://centos.mirroring.pulsant.co.uk/7/isos/x86_64/CentOS-7-x86_64-Minimal-1804.iso", 
          "iso_checksum": "714acc0aefb32b7d51b515e25546835e55a90da9fb00417fbee2d03a62801efd",
          "iso_checksum_type": "sha256",
          "ssh_username": "root", >> id for iso
          "ssh_password": "root",  >> password for iso
          "communicator":"ssh", >> needed for ssh into the box
          "ssh_port": 22,
          "ssh_timeout": "20m", >> timeout for the packer incase something goes wrong while build.
          "boot_wait": "10s", >> time before the packer boots the machine to be created using ssh.
          "guest_os_type": "RedHat_64",
          "headless": true, >> for silent installation
          "http_directory": "http", >> dir where kickstart file is placed.
          "shutdown_command": "echo 'packer' | sudo -S shutdown -P now",
          "boot_command": [
            "<up><wait><tab> text ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter><wait>" >> ks.cfg is kickstart file applied at boot time which contains the configuration of machine.
          ]
          
  }]
}
```



##  Provisioners

Provisioners are configured as part of the template. Packer supports the following provisioners.

1. Ansible

2. Chef

3. Salt

4. Shell

5. Powershell

6. Windows cmd

7. File — For copying file from local directory to VM image.

## Post-Processors

Post-processors run after the image is built by the builder and provisioned by the provisioner(s). Post-processors are optional, and they can be used to upload artifacts, re-package, or more. 

Post processors supported as of now can be found [here](https://www.packer.io/docs/post-processors/index.html)