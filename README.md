# First build a fresh vagrant/virtualbox box with the provided json manifest,kickstart config, and setup/teardown scripts
$ packer build centos_7.7.1908.json

# Use your own ssh key, not the vagrant one
$ cp ~/.ssh/id_rsa.pub public.key

# Then just vagrant up with your fresh box
$ vagrant up



# CentosDevBox_vagrant
Centos DevBox Vagrantfile with unit test

```
/tmp/vagrantfile_run.t .. ok
All tests successful.
Files=1, Tests=15,  0 wallclock secs ( 0.01 usr  0.01 sys +  0.48 cusr  0.06 csys =  0.56 CPU)
Result: PASS
```
