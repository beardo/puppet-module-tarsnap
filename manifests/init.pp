class tarsnap($ensure = latest, $key_file = '/etc/tarsnap.key') {

  package { "tarsnap":
    provider => "dpkg",
    ensure  => $ensure,
    source => "puppet:///modules/tarsnap/pkg/tarsnap_1.0.35_amd64.deb",
  }

  file { "/etc/tarsnap.conf":
    content => template("tarsnap/tarsnap.conf.erb"),
    require => Package["tarsnap"],
  }
}
