class tarsnap($ensure = latest) {

  file { "/tmp/tarsnap_1.0.35_amd64.deb":
    owner   => root,
    group   => root,
    mode    => 644,
    ensure  => present,
    source  => "puppet:///modules/tarsnap/pkg/tarsnap_1.0.35_amd64.deb",
  }

  package { "tarsnap":
    provider => "dpkg",
    ensure  => $ensure,
    source => "/tmp/tarsnap_1.0.35_amd64.deb",
    require => File['/tmp/tarsnap_1.0.35_amd64.deb'],
  }

  file { "/etc/tarsnap.conf":
    content => template("tarsnap/tarsnap.conf.erb"),
    require => Package["tarsnap"],
  }

}
