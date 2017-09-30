node default {
  # mod 'razorsedge-openvmtools', '1.1.0'
  include ::openvmtools
  
  class { '::openvmtools':
  with_desktop => filse,
  }
  
  # mod 'saz-motd', '2.4.0'
  class { 'motd': }

  # mod 'puppetlabs-ntp', '6.2.0'
  class { '::ntp':
  servers => [ 'clock.stellarcreative.lab' ],
  }
  
  # Disable ipv6 via sysctl - this needs dracut -f if it breaks rpcbind
  # TODO: move disabling ipv6 to kickstart
  sysctl { 'net.ipv6.conf.all.disable_ipv6':
  value => '1' }
  
  # mod 'puppetlabs-firewall', '1.9.0' 
  class { 'firewall':
  ensure => 'stopped',
  }

  # mod 'saz-sudo', '4.2.0'
  class { 'sudo': }
  sudo::conf { 'systems':
  priority =>   10,
  source   =>   'puppet:///files/sudo/systems.conf',
  }

  # mod 'yuav-autofs', '1.2.4'
  class { 'autofs':
  'mount_files' => {
  'net' =>  {
   mountpoint  => '/net',
   file_source => 'puppet:///files/autofs/auto.net.data',
   },
  'job' => {
   mountpoint  => '/job',
   file_source => 'puppet:///files/autofs/auto.job.data',
  }
  }
}
}

node kam1.stellarcreative.lab {
  # mod 'puppetlabs-firewall', '1.9.0' 
  class { 'firewall':
    ensure =>  'stopped',
  }
            
  # mod 'puppetlabs-puppetdb', '6.0.1'
  # Configure puppetdb and its underlying database
  class { 'puppetdb': }

  # Configure the Puppet master to use puppetdb
  class { 'puppetdb::master::config': }
  }

node box49.stellarcreative.lab {
}
