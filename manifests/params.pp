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
      $conf_template = 'rsyslog.conf.deb.erb'
      $conf_dir     = '/etc/rsyslog.d'
    }
    'RedHat', 'Amazon': {
      $package_name = 'rsyslog'
      $service_name = 'rsyslog'
      $conf_template = 'rsyslog.conf.el.erb'
      $conf_dir     = '/etc/rsyslog.d'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
  $tcp_port = '514'
}
