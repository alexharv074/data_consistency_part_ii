class javaprops {

  file { '/home/webapp/config.properties':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    content => template('javaprops/config.properties.erb'),
  }
}
