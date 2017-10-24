# packages installed by puppet
class profile::packages {

  # yum repos that puppet will manage

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
  
  # elrepo for nvidia driver
  yumrepo { 'elrepo':
    baseurl => 'http://elrepo.org/linux/elrepo/el7/$basearch/',
    descr   => 'ELRepo.org Community Enterprise Linux Repository - el7',
    gpgcheck => '0',
    enabled => '1',
  }
  package { kmod-nvidia:
    ensure => present,
    require => Yumrepo["elrepo"],
  }

  # common packages
  package { 'epel-release': ensure => 'installed', }
  package { 'bind-utils': ensure => 'installed', }
  package { 'nfs-utils': ensure => 'installed', }
  package { 'nmap': ensure => 'installed', }
  package { 'zsh': ensure => 'installed', }
  package { 'screen': ensure => 'installed', }
  package { 'vim-enhanced': ensure => 'installed', }
  package { 'wget': ensure => 'installed', }
  package { 'htop': ensure => 'installed', }
  package { 'tcsh': ensure => 'installed', }
  package { 'Thunar': ensure => 'installed', }
  package { 'bash-completion': ensure => 'installed', }
  package { 'audiofile': ensure => 'installed', }
  package { 'audiofile-devel': ensure => 'installed', }
}
