# == Class rsyslog::config
#
# This class is called from rsyslog
#
class rsyslog::config (
  $udp_port = $rsyslog::udp_port,
  $tcp_port = $rsyslog::tcp_port,
  $conf_template = $rsyslog::conf_template,
  $conf_dir      = $rsyslog::conf_dir,
){
  file { $conf_dir:
    ensure  => directory,
  }

  file { '/etc/rsyslog.conf':
    ensure  => present,
    content => template("rsyslog/${conf_template}"),
  }

  if defined($tcp_port) {
    file { "${conf_dir}/tcp_listen.conf":
      ensure  => present,
      content => template('rsyslog/tcp_listen.conf.erb'),
      require => File[$conf_dir],
    }
  }
}
