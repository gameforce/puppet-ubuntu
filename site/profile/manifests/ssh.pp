class profile::ssh {
  
  # disable strict host checking in ssh
  file { '/etc/ssh/sshd_config':
    ensure    => 'present',
    owner     => 'root',
    group     => 'root',
    mode      => '0600',
    source    => 'puppet:///files/ssh/sshd_config',
  }

  service { sshd:
    ensure    =>  running,
    subscribe =>  File["/etc/ssh/sshd_config"],
  }
}