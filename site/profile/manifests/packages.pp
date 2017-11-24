# packages installed by puppet
class profile::packages {

  # fact check for systype
  #if $facts['systype'] == 'desktop' {
  if $facts['systype'] == 'desktop' {
    notice ('This is a desktop $1')
    notify {"This is a $systype" :}
  }
  elsif $facts['systype'] == 'server' {
    notice ('This is not a server #systype $1')
    notify {"this is a serber $1 $systype" :}
  }

  # ius repo and package for python3
  yumrepo { 'ius':
    baseurl => 'https://dl.iuscommunity.org/pub/ius/stable/CentOS/7/$basearch',
    descr   => 'ius',
    gpgcheck => '0',
    enabled => '1',
  }
  package { python36u:
    ensure => present,
    require => Yumrepo["ius"],
  }

  # common packages
  package { 'epel-release': ensure => 'installed', }
  package { 'bind-utils': ensure => 'installed', }
  package { 'nfs-utils': ensure => 'installed', }
  package { 'nmap': ensure => 'installed', }
  package { 'zsh': ensure => 'installed', }
  package { 'screen': ensure => 'installed', }
  package { 'vim-enhanced': ensure => 'installed', }
  package { 'htop': ensure => 'installed', }
}
