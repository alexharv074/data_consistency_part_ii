class loopback {

  $rest_api_root = '/api'
  $host = '0.0.0.0'
  $port = 3000

  file { '/server/config.json':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    content => template('loopback/config.json.erb'),
  }
}
