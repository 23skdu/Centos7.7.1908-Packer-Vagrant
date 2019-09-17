#!/bin/bash -eux

#Cleanup yum
yum clean all

#zero out rest of free space
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

# Add `sync` so Packer doesn't quit too early, before the large file is deleted.
sync
