# First build a fresh vagrant/virtualbox box with the provided json manifest,kickstart config, and setup/teardown scripts
$ packer build centos_7.7.1908.json

# Then just vagrant up with your fresh box
$ vagrant up

# CentosDevBox_vagrant
Centos DevBox Vagrantfile with unit test

```
$ prove -v t/vagrantfile_run.t 
t/vagrantfile_run.t .. 
checking installed OS packages
ok 1 - RPMS ok
ok 2 - require Redis;
ok 3 - require Net::LDAP;
ok 4 - require File::Which;
ok 5 - require Test::Simple;
ok 6 - require Test::More;
ok 7 - require DBI;
ok 8 - require DBD::Pg;
ok 9 - require Perl::Critic;
ok 10 - require Test::Subroutines;
ok 11 - require Cpanel::JSON::XS;
ok 12 - require Data::Dumper;
ok 13 - require Try::Tiny;
ok 14 - require Math::Random::Secure;
ok 15 - require Text::Lorem;
ok 16 - require Digest::xxHash;
ok 17 - require LWP::UserAgent::Determined;
ok 18 - require Excel::Writer::XLSX;
ok 19 - require DBIx::Class;
ok 20 - require Template::Toolkit;
ok 21 - require Catalyst::Runtime;
ok 22 - require Catalyst::Devel;
1..22
ok
All tests successful.
Files=1, Tests=22,  1 wallclock secs ( 0.03 usr  0.00 sys +  0.79 cusr  0.10 csys =  0.92 CPU)
Result: PASS
```
