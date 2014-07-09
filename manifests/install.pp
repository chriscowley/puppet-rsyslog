# == Class rsyslog::install
#
class rsyslog::install {

  package { $rsyslog::package_name:
    ensure => present,
  }
}
