# == Class rsyslog::params
#
# This class is meant to be called from rsyslog
# It sets variables according to platform
#
class rsyslog::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'rsyslog'
      $service_name = 'rsyslog'
    }
    'RedHat', 'Amazon': {
      $package_name = 'rsyslog'
      $service_name = 'rsyslog'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
