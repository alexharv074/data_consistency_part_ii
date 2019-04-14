class hiera {

  $codedir = '/etc/puppetlabs/code'
  $confdir = '/etc/puppetlabs/puppet'

  file { "$confdir/hiera.yaml":
    ensure  => present,
    owner   => 'root',
    group   => 'root',
    mode    => '0444',
    content => template('hiera/hiera.yaml.erb'),
  }
}
