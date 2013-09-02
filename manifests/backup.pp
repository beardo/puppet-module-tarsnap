define tarsnap::backup($ensure=present,
                       $directories={},
                       $files={},
                       $commands={},
                       $hour=1,
                       $minute=0)  {

  $backup_script = "/usr/local/bin/tarsnap-backup-${name}"

  file { $backup_script:
    ensure => $ensure,
    content => template("tarsnap/tarsnap-backup.py.erb"),
    mode => 744,
  }

  file { "/var/log/backup":
    ensure => present,
    owner => root,
    group => root,
    mode => 600,
  }

  cron { "tarsnap-backup-${name}":
    ensure => $ensure,
    command => "$backup_script 1> /var/log/backup 2> /var/log/backup",
    hour => $hour,
    minute => $minute,
    require => [File[$backup_script], File[$tarsnap::key_file], File["/var/log/backup"]],
  }
}
