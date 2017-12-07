# packages installed by puppet
class profile::packages {

  # fact check for systype
  if $facts['systype'] == 'desktop' {
       #notify {"This is a $systype Installing desktop packages" :}
       package { 'kmod-wacom': ensure => 'installed', }
       package { 'xorg-x11-drv-wacom': ensure => 'installed', }
       package{'epson-inkjet-printer-escpr2':
            provider => 'rpm',
            ensure => 'present',
            source => '/net/systems/repos/stellar/epson-inkjet-printer-escpr2-1.0.9-1lsb3.2.x86_64.rpm',
        }


    # ius repo and package for python3
    yumrepo { 'ius':
       baseurl  => 'https://dl.iuscommunity.org/pub/ius/stable/CentOS/7/$basearch',
       descr    => 'ius',
       gpgcheck => '0',
       enabled  => '1',
    }
    package { python36u:
       ensure   => present,
       require  => Yumrepo["ius"],
    }

    # enable pipeline toolbox on autostart
    file { '/etc/xdg/autostart/toolbox.desktop':
      ensure          =>  'present',
      owner           =>  'root',
      group           =>  'root',
      mode            =>  '0644',
      source          =>  'puppet:///files/stellar/toolbox.desktop',
    }
  }
  elsif $facts['systype'] == 'server' {
     #notify {"this is a $systype Installing server packages" :}
  }
  else {
    # install common packages
    package { 'epel-release': ensure => 'installed', }
    package { 'bind-utils': ensure => 'installed', }
    package { 'nfs-utils': ensure => 'installed', }
    package { 'nmap': ensure => 'installed', }
    package { 'zsh': ensure => 'installed', }
    package { 'screen': ensure => 'installed', }
    package { 'vim-enhanced': ensure => 'installed', }
    package { 'htop': ensure => 'installed', }
  }
}
