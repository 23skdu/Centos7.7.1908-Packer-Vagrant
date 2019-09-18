use Test::More;
print "checking installed OS packages\n";
if ( system('rpm --quiet -q autoconf automake binutils bison flex gcc gcc-c++ gettext libtool make patch pkgconfig rpm-build rpm-sign git indent patchutils ant babel cmake perltidy rpmlint epel-release httpd httpd-devel php-ldap php-xml curl curl-devel openldap openldap-devel yum-utils device-mapper-persistent-data lvm2 unzip wget bzip2 file git ruby ruby-devel python python-devel perl-File-Which perl-Pod-Spell perl-App-cpanminus postgresql-devel postgresql-server sqlite sqlite-devel redis icewm lighttpd nodejs python2-pip python3 python3-devel docker-ce docker-ce-cli containerd.io code filebeat nginx') eq 0 ) { pass('RPMS ok'); } else { fail('RPMS missing'); }
my @perl_modules = qw/Redis Net::LDAP File::Which Test::Simple Test::More DBI DBD::Pg Perl::Critic Test::Subroutines Cpanel::JSON::XS Data::Dumper Try::Tiny Math::Random::Secure Text::Lorem Digest::xxHash LWP::UserAgent::Determined Excel::Writer::XLSX DBIx::Class Template::Toolkit Catalyst::Runtime Catalyst::Devel/;

foreach $module(@perl_modules) { require_ok($module); }

done_testing();
