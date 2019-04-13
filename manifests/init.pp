class loopback {

  file { '/server/config.json':
    ensure => present,
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
    source => 'puppet:///modules/loopback/config.json',
  }
}
