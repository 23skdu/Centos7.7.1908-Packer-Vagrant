# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "file://virtualbox-centos7.7.1908.box"
  config.vm.network "public_network", :bridge => 'enp0s25'
  config.vm.network "private_network", virtualbox__intnet: "intnet"
  config.vm.synced_folder "/spack", "/spack", type: 'nfs'
  config.vm.synced_folder "/CODE", "/CODE", type: 'nfs'
  config.vm.hostname = 'MyDevVM'
   config.vm.provider "virtualbox" do |vb|
     vb.gui = true 
     vb.memory = "4096"
     vb.cpus = 2
   end
  config.vm.provision "file", source: "repos/elasticsearch.repo", destination: "/tmp/elasticsearch.repo" 
  config.vm.provision "file", source: "repos/nginx.repo", destination: "/tmp/nginx.repo"
  config.vm.provision "file", source: "repos/vscode.repo", destination: "/tmp/vscode.repo"
  config.vm.provision "file", source: "t/vagrantfile_run.t", destination: "/tmp/vagrantfile_run.t"
  config.vm.provision "shell", inline: <<-SHELL
     echo 'Yum Installing: autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig rpm-build rpm-sign git indent patchutils ant babel cmake perltidy rpmlint epel-release apache/php curl openldap openldap-devel yum-utils device-mapper-persistent-data lvm2 unzip wget patch bzip2 file git ruby ruby-devel python python-devel perl-App-cpanminus perl-File-Which perl-Pod-Spell postgresql-devel postgresql-server sqlite sqlite-devel'
     yum install -y autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig rpm-build rpm-sign git indent patchutils ant babel cmake perltidy rpmlint epel-release httpd httpd-devel php-ldap php-xml curl curl-devel openldap openldap-devel yum-utils device-mapper-persistent-data lvm2 unzip wget bzip2 file git python python-devel perl-File-Which perl-Pod-Spell perl-App-cpanminus postgresql-devel postgresql-server sqlite sqlite-devel >> /root/yum_install.log 
     echo 'Installing EPEL Packages: redis icewm lighttpd nodejs python2-pip python36 python36-devel'
     yum install -y redis icewm lighttpd nodejs python2-pip python36 python36-pip python36-devel >> /root/yum_install.log 
     echo 'Installing Docker Community Edition'
     yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
     yum install -y -q docker-ce docker-ce-cli containerd.io /root/yum_install.log 
     echo 'Installing latest Chrome browser'
     wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
     yum localinstall -y -q google-chrome-stable_current_x86_64.rpm
     rm google-chrome-stable_current_x86_64.rpm
     echo 'Installing Filebeat and adding elasticsearch repo'
     mv /tmp/elasticsearch.repo /etc/yum.repos.d/
     rpm --quiet --import https://packages.elastic.co/GPG-KEY-elasticsearch
     yum install -y -q filebeat
     echo "Installing Visual Code from Microsoft from their repo"
     rpm --quiet --import https://packages.microsoft.com/keys/microsoft.asc
     mv /tmp/vscode.repo /etc/yum.repos.d/
     yum install -y -q code
     echo "Installing Nginx from Nginx.org repo"
     mv /tmp/nginx.repo /etc/yum.repos.d/
     yum install -y -q nginx
     echo 'Clean up Yum'
     yum clean all
     echo "Instaling Ruby Rspec"
     gem install rspec
     echo "Installing Ruby Version Manager (RVM)"
     gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
     \curl -sSL https://get.rvm.io | bash
     echo "Upgrading PIP and PIP3.6"
     pip2 install --upgrade pip
     python3.6 -m pip install --upgrade pip
     echo "Python PIP: consulate python-consul python-ldap xxhash XlsxWriter lorem hvac redis psycopg2 pandas PyTest urllib3"
     pip2 install -q consulate python-consul python-ldap xxhash XlsxWriter lorem hvac redis psycopg2 numpy pandas test urllib3
     echo "Python3.6 PIP: consul-kv python-ldap xxhash XlsxWriter lorem hvac redis numpy psycopg2 pandas PyTest urllib3"
     python3.6 -m pip install -q consulate python-consul consul-kv python-ldap xxhash XlsxWriter lorem hvac redis psycopg2 numpy pandas test urllib3
     echo 'cpanminus install of Consul perl client'
     cpanm -i -q Consul
     echo 'cpaniminus Installs: Perl::Critic Test::More etc.'
     cpanm -i -q Test::More
     echo "File::Which and Pod::Spell had to be rpm installed because they fail as build deps for Perl::Critic"
     cpanm -i -q Perl::Critic
     cpanm -i -q WebService::HashiCorp::Vault Test::Simple Net::LDAP Email::Stuffer DBI DBD::Pg DBD::SQLite Test::Subroutines Cpanel::JSON::XS Data::Dumper Try::Tiny Math::Random::Secure Text::Lorem Digest::xxHash LWP::UserAgent::Determined Excel::Writer::XLSX DBIx::Class
     cpanm -i -q Redis Template::Toolkit 
     cpanm -i -q Catalyst::Runtime 
     cpanm -i -q Catalyst::Devel 
     echo 'Cleaning up cpanminus'
     rm -rf /root/.cpanm/
     echo 'Installing Node Modules: consul redis tap moment lodash async karma request socket.io react angular'
     npm install -g consul redis tap moment lodash async karma request socket.io react angular >> /root/nodemodule_install.log 
     echo "Done. Proceeding to Test"
     sudo /usr/local/bin/prove -v /tmp/vagrantfile_run.t > /etc/motd 
     rm /tmp/vagrantfile_run.t
   SHELL
end
