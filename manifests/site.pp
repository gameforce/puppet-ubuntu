node default {# node default opening brace
  # Set ntp server
  class { '::ntp':
    servers => [ 'clock.stellarcreativ.lab' ],
    }
  
  # Disable ipv6 via sysctl - this needs dracut -f if it breaks rpcbind
  sysctl { 'net.ipv6.conf.all.disable_ipv6': 
    value => '1' }

}# node default closing brace

node kam1.stellarcreative.lab {
  # Configure puppetdb and its underlying database
  class { 'puppetdb': }

  # Configure the Puppet master to use puppetdb
  class { 'puppetdb::master::config': }
}
