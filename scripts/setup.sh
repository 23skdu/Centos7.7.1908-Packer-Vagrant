#!/bin/bash -eux
sudo rpm -i http://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo yum -y install bzip2 make perl kernel-devel dkms
sudo systemctl start dkms
sudo systemctl enable dkms
sudo mkdir /media/guest
sudo mount -o loop /tmp/VBoxGuestAdditions.iso /media/guest
cd /media/guest
sudo ./VBoxLinuxAdditions.run
sudo yum update -y
sudo yum clean all
