class puppet::agent {

  $agent_certname = 'agent01.example.com'
  $puppet_server = 'puppet'

  file { '/etc/puppetlabs/puppet/puppet.conf':
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    content => template('puppet/puppet.conf.erb'),
  }
}
